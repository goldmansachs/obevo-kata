///**
// * Copyright 2017 Goldman Sachs.
// * Licensed under the Apache License, Version 2.0 (the "License");
// * you may not use this file except in compliance with the License.
// * You may obtain a copy of the License at
// *
// *     http://www.apache.org/licenses/LICENSE-2.0
// *
// * Unless required by applicable law or agreed to in writing,
// * software distributed under the License is distributed on an
// * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// * KIND, either express or implied.  See the License for the
// * specific language governing permissions and limitations
// * under the License.
// */
//package example.unittest;
//
//import com.gs.obevo.db.api.appdata.DbEnvironment;
//import com.gs.obevo.db.impl.core.jdbc.JdbcHelper;
//import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
//import com.gs.obevo.db.unittest.UnitTestDbBuilder;
//import org.apache.commons.dbcp.BasicDataSource;
//import org.apache.commons.dbutils.QueryRunner;
//import org.apache.commons.dbutils.handlers.MapListHandler;
//import org.junit.Before;
//import org.junit.Ignore;
//import org.junit.Test;
//
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.sql.Timestamp;
//import java.util.List;
//import java.util.Map;
//
//import static org.junit.Assert.assertEquals;
//
///**
// * Remember to start your DB using the kata-files/setup/startDb.sh or startDb.bat script before running ths JUnit test.
// */
//@Ignore
//public class ExampleDbUnitTest {
//    private DataSource ds;
//
//    @Before
//    public void setup() {
//        DbEnvironment db = new UnitTestDbBuilder()
//                .setSourcePath("./src/main/database")
//                .setReferenceEnvName("test")
//                .setDbPlatform(new HsqlDbPlatform())
//                .setDbServer("mytest")
//                .buildContext()
//                .setupAndCleanAndDeploy()
//                .getEnvironment();
//
//        System.out.println("in case you want to see what the url will be: " + db.getJdbcUrl());
//
//        // create the datasource for your test. You have the option to append URL parameters to simulate your actual app conditions if you'd like
//        BasicDataSource ds = new BasicDataSource();
//        ds.setUrl(db.getJdbcUrl() + ";schema=DEMO_SCHEMA");
//        ds.setUsername(db.getDefaultUserId());
//        ds.setPassword(db.getDefaultPassword());
//        this.ds = ds;
//    }
//
//    @Test
//    public void exampleTest() throws Exception {
//        // load your data
//        loadData(ds);
//
//        // Now run your test once the setup is done
//        QueryRunner jdbc = new QueryRunner(ds);
//
//        List<Map<String, Object>> tableCResults = jdbc.query("select * from DYN_TABLE_C ORDER BY C_ID", new MapListHandler());
//        System.out.println("Print DYN_TABLE_C for debug");
//        for (Map<String, Object> result : tableCResults) {
//            System.out.println("DYN_TABLE_C ROW: " + result);
//        }
//        assertEquals(5, tableCResults.size());
//        assertTableCRow(tableCResults, 0, 1, 1, "row1", null);
//        assertTableCRow(tableCResults, 1, 2, 2, "row  2", Timestamp.valueOf("2013-01-02 12:34:56"));
//        assertTableCRow(tableCResults, 2, 3, 2, "", Timestamp.valueOf("2013-01-02 12:34:56.1"));
//        assertTableCRow(tableCResults, 3, 4, 2, "  row  4  ", Timestamp.valueOf("2013-01-02 12:34:56.234"));
//        assertTableCRow(tableCResults, 4, 5, 2, null, Timestamp.valueOf("2013-01-02 12:34:56.567891"));
//
//        List<Map<String, Object>> tableDResults = jdbc.query("select * from DYN_TABLE_D ORDER BY D_ID", new MapListHandler());
//        System.out.println("Print DYN_TABLE_D for debug");
//        for (Map<String, Object> result : tableDResults) {
//            System.out.println("DYN_TABLE_D ROW: " + result);
//        }
//        assertEquals(3, tableDResults.size());
//        assertTableDRow(tableDResults, 0, 1);
//        assertTableDRow(tableDResults, 1, 2);
//        assertTableDRow(tableDResults, 2, 3);
//    }
//
//    private void loadData(DataSource ds) {
//        try (Connection connection = ds.getConnection()) {
//            JdbcHelper jdbc = new JdbcHelper();
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_D (D_ID) VALUES (1)");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_D (D_ID) VALUES (2)");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_D (D_ID) VALUES (3)");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_C (C_ID,D_ID,STRING_FIELD,TIMESTAMP_FIELD) VALUES (1,1,'row1',null)");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_C (C_ID,D_ID,STRING_FIELD,TIMESTAMP_FIELD) VALUES (2,2,'row  2','2013-01-02 12:34:56')");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_C (C_ID,D_ID,STRING_FIELD,TIMESTAMP_FIELD) VALUES (3,2,'','2013-01-02 12:34:56.1')");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_C (C_ID,D_ID,STRING_FIELD,TIMESTAMP_FIELD) VALUES (4,2,'  row  4  ','2013-01-02 12:34:56.234')");
//            jdbc.update(connection, "INSERT INTO DEMO_SCHEMA.DYN_TABLE_C (C_ID,D_ID,STRING_FIELD,TIMESTAMP_FIELD) VALUES (5,2,null,'2013-01-02 12:34:56.567891')");
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    private void assertTableDRow(List<Map<String, Object>> results, int index, int dId) {
//        assertEquals(dId, results.get(index).get("D_ID"));
//    }
//
//    private void assertTableCRow(List<Map<String, Object>> results, int index, int cId, int dId, String stringField, Timestamp timestampField) {
//        assertEquals(cId, results.get(index).get("C_ID"));
//        assertEquals(dId, results.get(index).get("D_ID"));
//        assertEquals(stringField, results.get(index).get("STRING_FIELD"));
//        assertEquals(timestampField, results.get(index).get("TIMESTAMP_FIELD"));
//    }
//}
