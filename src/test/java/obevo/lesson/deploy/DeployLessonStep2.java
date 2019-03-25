/**
 * Copyright 2017 Goldman Sachs.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package obevo.lesson.deploy;

import com.gs.obevo.dbmetadata.api.DaColumn;
import com.gs.obevo.dbmetadata.api.DaTable;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertThat;

public class DeployLessonStep2 extends DeployLessonBase {
    @Test
    public void verifyTables() throws Exception {
        assertThat("All tables have been deployed",
                dbCatalog.getTables().reject(DaTable::isView).collect(DaTable::getName)
                        .collect(String::toLowerCase)  // move to lowercase to account for case differences between PostgreSQL and HSQL
                        .reject(tab -> tab.startsWith("artifact")),  // ignore Obevo's internal tables
                containsInAnyOrder("accesslog", "account", "accounttype", "country", "person")
        );
    }


    @Test
    public void verifyAccountColumns() throws Exception {
        DaTable accountTable = dbCatalog.getTables().detect(tab -> tab.getName().equalsIgnoreCase("Account"));

        assertThat("Account columns have been deployed",
                accountTable.getColumns().collect(DaColumn::getName)
                        .collect(String::toLowerCase),  // move to lowercase to account for case differences between PostgreSQL and HSQL
                containsInAnyOrder("id", "accountbalance", "accountholder_id", "accounttype_id", "accountopendate", "rollbackimmediate")
        );
    }


    @Test
    public void verifyAccountTypeColumns() throws Exception {
        DaTable accountTable = dbCatalog.getTables().detect(tab -> tab.getName().equalsIgnoreCase("AccountType"));

        assertThat("AccountType columns have been deployed",
                accountTable.getColumns().collect(DaColumn::getName)
                        .collect(String::toLowerCase),  // move to lowercase to account for case differences between PostgreSQL and HSQL
                containsInAnyOrder("id", "type", "description")
        );
    }


    @Test
    public void verifyPersonColumns() throws Exception {
        DaTable accountTable = dbCatalog.getTables().detect(tab -> tab.getName().equalsIgnoreCase("Person"));

        assertThat("AccountType columns have been deployed",
                accountTable.getColumns().collect(DaColumn::getName)
                        .collect(String::toLowerCase),  // move to lowercase to account for case differences between PostgreSQL and HSQL
                containsInAnyOrder("id", "firstname", "lastname", "addresscountryname", "dob")
        );
    }


    @Test
    public void verifyChangesDoneSeparatelyForAccount() throws Exception {
        assertThat("Hopefully you have your two Account table updates in separate //// CHANGE scripts and not combined into one? (Expecting 5 total in the file)",
                jdbc.query("select count(*) from DEMO_SCHEMA.ArtifactDeployment where objectname = 'Account'", new ScalarHandler<Integer>()),
                equalTo(5L)
        );
    }


    @Test
    public void verifyChangesDoneSeparatelyForPerson() throws Exception {
        assertThat("Hopefully you have your two Person table updates in separate //// CHANGE scripts and not combined into one? (Expecting 3 total in the file)",
                jdbc.query("select count(*) from DEMO_SCHEMA.ArtifactDeployment where objectname = 'Person'", new ScalarHandler<Integer>()),
                equalTo(3L)
        );
    }


    @Test
    public void verifyViews() throws Exception {
        assertThat("All views have been deployed",
                dbCatalog.getTables().select(DaTable::isView).collect(DaTable::getName)
                        .collect(String::toLowerCase),  // move to lowercase to account for case differences between PostgreSQL and HSQL
                containsInAnyOrder("accountview", "checkingaccountview")
        );
    }


    @Test
    public void verifyStaticDataOnAccountType() throws Exception {
        assertThat("Static data for AccountType is deployed correctly",
                jdbc.query("select type from DEMO_SCHEMA.AccountType", new ColumnListHandler<>(1)),
                containsInAnyOrder("CH", "SV", "CD")
        );
    }


    @Test
    public void verifyStaticDataOnCountry() throws Exception {
        assertThat("Static data for Country is deployed correctly",
                jdbc.query("select id from DEMO_SCHEMA.Country", new ColumnListHandler<>(1)),
                containsInAnyOrder("US", "SG", "UK", "JP", "BR")
        );
        assertThat("Static data for Country is deployed correctly",
                jdbc.query("select name from DEMO_SCHEMA.Country where id = 'US'", new ColumnListHandler<>(1)),
                containsInAnyOrder("United States of America")
        );
    }
}
