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
package obevo.lesson.reveng;

import com.gs.obevo.api.appdata.PhysicalSchema;
import com.gs.obevo.api.factory.Obevo;
import com.gs.obevo.db.api.appdata.DbEnvironment;
import com.gs.obevo.db.api.platform.DbDeployerAppContext;
import com.gs.obevo.dbmetadata.api.DaCatalog;
import com.gs.obevo.dbmetadata.api.DaSchemaInfoLevel;
import com.gs.obevo.dbmetadata.api.DbMetadataManager;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.jetbrains.annotations.NotNull;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

public class RevengLessonBase {
    private static final Logger LOG = LoggerFactory.getLogger(RevengLessonBase.class);
    public static final String KATA_PLATFORM = "postgresql";
    public static final boolean EXECUTE_DEPLOY = false;

    public static final String USERNAME = "katadeployer";
    public static final String PASSWORD = "katadeploypass";

    private static BasicDataSource ds;
    protected static QueryRunner jdbc;
    protected static DaCatalog dbCatalog;
    protected static DaCatalog devDbCatalog;
    private static File sourcePath = new File("./src/main/database/lesson/reveng/final").getAbsoluteFile();

    @BeforeClass
    public static void setup() {
        if (!sourcePath.exists()) {
            LOG.info("Not setting up DB connections as the reverse-engineered files aren't yet available: " + sourcePath);
            return;
        }
        DbDeployerAppContext dbAppContext = getEnv(EXECUTE_DEPLOY);
        DbMetadataManager dbMetadataManager = dbAppContext.getDbMetadataManager();
        ds = getDataSource(dbAppContext);
        jdbc = new QueryRunner(ds);
        dbCatalog = dbMetadataManager.getDatabase(new PhysicalSchema("MYLARGESCHEMA"), new DaSchemaInfoLevel().setRetrieveTableAndColumnDetails(), true, false);
        if (dbMetadataManager.getDatabaseOptional(new PhysicalSchema("MYLARGESCHEMA_DEV1")) != null) {
            devDbCatalog = dbMetadataManager.getDatabase(new PhysicalSchema("MYLARGESCHEMA_DEV1"), new DaSchemaInfoLevel().setRetrieveTableAndColumnDetails(), true, false);
        }
    }


    @AfterClass
    public static void teardown() throws Exception {
        if (ds != null) {
            ds.close();
        }
    }

    @NotNull
    private static BasicDataSource getDataSource(DbDeployerAppContext dbAppContext) {
        DbEnvironment db = dbAppContext.getEnvironment();
        // create the datasource for your test. You have the option to append URL parameters to simulate your actual app conditions if you'd like
        BasicDataSource ds = new BasicDataSource();
        ds.setUrl(db.getJdbcUrl());
        ds.setUsername(USERNAME);
        ds.setPassword(PASSWORD);
        return ds;
    }


    @NotNull
    private static DbDeployerAppContext getEnv(boolean deploy) {
        DbEnvironment env = Obevo.readEnvironment(sourcePath.getAbsolutePath(), "prod");
        DbDeployerAppContext dbAppContext = (DbDeployerAppContext) Obevo.buildContext(env, USERNAME, PASSWORD);
        if (deploy) {
            dbAppContext.deploy();
        }
        return dbAppContext;
    }
}
