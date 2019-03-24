package example.unittest;

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

public class DeployLessonBase {
    public static final String KATA_PLATFORM = "postgresql";
    public static final boolean EXECUTE_DEPLOY = false;

    public static final String USERNAME = "katadeployer";
    public static final String PASSWORD = "katadeploypass";

    private static BasicDataSource ds;
    protected static QueryRunner jdbc;
    protected static DaCatalog dbCatalog;

    @BeforeClass
    public static void setup() {
        DbDeployerAppContext dbAppContext = getEnv(EXECUTE_DEPLOY);
        DbMetadataManager dbMetadataManager = dbAppContext.getDbMetadataManager();
        ds = getDataSource(dbAppContext);
        jdbc = new QueryRunner(ds);
        dbCatalog = dbMetadataManager.getDatabase(new PhysicalSchema("DEMO_SCHEMA"), new DaSchemaInfoLevel().setRetrieveTableAndColumnDetails(), true, false);
    }


    @AfterClass
    public static void teardown() throws Exception {
        ds.close();
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
        DbEnvironment env = Obevo.readEnvironment("./src/main/database/system-config-" + KATA_PLATFORM + ".xml", "test");
        DbDeployerAppContext dbAppContext = (DbDeployerAppContext) Obevo.buildContext(env, USERNAME, PASSWORD);
        if (deploy) {
            dbAppContext.deploy();
        }
        return dbAppContext;
    }
}
