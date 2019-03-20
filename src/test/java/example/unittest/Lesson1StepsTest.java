package example.unittest;

import com.gs.obevo.api.appdata.PhysicalSchema;
import com.gs.obevo.api.factory.Obevo;
import com.gs.obevo.db.api.appdata.DbEnvironment;
import com.gs.obevo.db.api.platform.DbDeployerAppContext;
import com.gs.obevo.dbmetadata.api.DaCatalog;
import com.gs.obevo.dbmetadata.api.DaSchemaInfoLevel;
import com.gs.obevo.dbmetadata.api.DaTable;
import com.gs.obevo.dbmetadata.api.DbMetadataManager;
import org.eclipse.collections.api.collection.ImmutableCollection;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;

public class Lesson1StepsTest {
    @Test
    public void step1Check() {
        DbEnvironment env = Obevo.readEnvironment("./src/main/database");
        DbDeployerAppContext dbAppContext = (DbDeployerAppContext) Obevo.buildContext(env, "katadeployer", "katadeploypass");
        DbMetadataManager dbMetadataManager = dbAppContext.getDbMetadataManager();
        DaCatalog dbCatalog = dbMetadataManager.getDatabase(new PhysicalSchema("DEMO_SCHEMA"), new DaSchemaInfoLevel(), true, false);

        DaTable accountTypeTable = dbCatalog.getTables().detect(tab -> tab.getName().equalsIgnoreCase("ACCOUNTTYPE"));
        assertNotNull(accountTypeTable);
    }

    @Test
    public void step2Check() {

    }
}
