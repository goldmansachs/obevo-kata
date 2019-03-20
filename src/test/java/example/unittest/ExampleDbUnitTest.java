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

import com.gs.obevo.db.api.appdata.DbEnvironment;
import com.gs.obevo.db.impl.core.jdbc.JdbcHelper;
import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.db.unittest.UnitTestDbBuilder;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

/**
 * Remember to start your DB using the kata-files/setup/startDb.sh or startDb.bat script before running ths JUnit test.
 */
public class ExampleDbUnitTest {
    private static final Logger LOG = LoggerFactory.getLogger(ExampleDbUnitTest.class);

    private DataSource ds;

    @Before
    public void setup() {
        DbEnvironment db = new UnitTestDbBuilder()
                .setSourcePath("./src/main/database")
                .setReferenceEnvName("test")
                .setDbPlatform(new HsqlDbPlatform())
                .setDbServer("mytest")
                .buildContext()
                .setupAndCleanAndDeploy()
                .getEnvironment();

        LOG.info("in case you want to see what the url will be: {}", db.getJdbcUrl());

        // create the datasource for your test. You have the option to append URL parameters to simulate your actual app conditions if you'd like
        BasicDataSource ds = new BasicDataSource();
        ds.setUrl(db.getJdbcUrl() + ";schema=DEMO_SCHEMA");
        ds.setUsername(db.getDefaultUserId());
        ds.setPassword(db.getDefaultPassword());
        this.ds = ds;
    }

    @Test
    public void exampleTest() throws Exception {
        // load your data
        loadData(ds);

        // Now run your test once the setup is done
        QueryRunner jdbc = new QueryRunner(ds);

        List<Map<String, Object>> tableCResults = jdbc.query("select * from AccessLog ORDER BY ID", new MapListHandler());
        LOG.info("Print AccessLog for debug");
        for (Map<String, Object> result : tableCResults) {
            LOG.info("AccessLog ROW: {}", result);
        }

        assertEquals(4, tableCResults.size());
        assertAccessLogRow(tableCResults, 0, 1, 1, "Logging in", Timestamp.valueOf("2019-03-01 05:06:07"));
        assertAccessLogRow(tableCResults, 1, 2, 10, null, Timestamp.valueOf("2019-03-01 10:06:07"));
        assertAccessLogRow(tableCResults, 2, 3, 20, "Logging in 3", null);
        assertAccessLogRow(tableCResults, 3, 4, null, "Logging in 4", Timestamp.valueOf("2019-03-01 20:06:07"));
    }

    private void loadData(DataSource ds) throws SQLException {
        try (Connection connection = ds.getConnection()) {
            JdbcHelper jdbc = new JdbcHelper();
            jdbc.update(connection, "INSERT INTO AccessLog (id, accessTime, accessReason, accessCount) VALUES (1, '2019-03-01 05:06:07', 'Logging in', 1)");
            jdbc.update(connection, "INSERT INTO AccessLog (id, accessTime, accessReason, accessCount) VALUES (2, '2019-03-01 10:06:07', null, 10)");
            jdbc.update(connection, "INSERT INTO AccessLog (id, accessTime, accessReason, accessCount) VALUES (3, null, 'Logging in 3', 20)");
            jdbc.update(connection, "INSERT INTO AccessLog (id, accessTime, accessReason, accessCount) VALUES (4, '2019-03-01 20:06:07', 'Logging in 4', null)");
        }
    }

    private void assertAccessLogRow(List<Map<String, Object>> results, int index, int id, Integer count, String reason, Timestamp accessTime) {
        assertEquals(id, results.get(index).get("ID"));
        assertEquals(accessTime, results.get(index).get("ACCESSTIME"));
        assertEquals(reason, results.get(index).get("ACCESSREASON"));
        assertEquals(count, results.get(index).get("ACCESSCOUNT"));
    }
}
