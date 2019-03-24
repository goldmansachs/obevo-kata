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
package example.unittest;

import com.gs.obevo.dbmetadata.api.DaTable;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.junit.Test;

import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.junit.Assert.assertThat;

public class DeployLessonStep1 extends DeployLessonBase {
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
    public void verifyViews() throws Exception {
        assertThat("All views have been deployed",
                dbCatalog.getTables().select(DaTable::isView).collect(DaTable::getName)
                        .collect(String::toLowerCase),  // move to lowercase to account for case differences between PostgreSQL and HSQL
                containsInAnyOrder("accountview", "savingsaccountview")
        );
    }


    @Test
    public void verifyStaticDataOnAccountType() throws Exception {
        assertThat("Static data for AccountType is deployed correctly",
                jdbc.query("select type from DEMO_SCHEMA.AccountType", new ColumnListHandler<>(1)),
                containsInAnyOrder("CH", "SV")
        );
    }


    @Test
    public void verifyStaticDataOnCountry() throws Exception {
        assertThat("Static data for Country is deployed correctly",
                jdbc.query("select id from DEMO_SCHEMA.Country", new ColumnListHandler<>(1)),
                containsInAnyOrder("US", "SG", "UK", "JP", "VL")
        );
    }
}
