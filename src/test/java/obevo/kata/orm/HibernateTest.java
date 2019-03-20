package obevo.kata.orm;

import com.gs.obevo.db.api.platform.DbDeployerAppContext;
import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.db.unittest.UnitTestDbBuilder;
import example.unittest.Account;
import example.unittest.AccountType;
import example.unittest.Country;
import example.unittest.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;
import org.hibernate.dialect.HSQLDialect;
import org.hibernate.query.Query;
import org.junit.Before;
import org.junit.Test;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.Arrays;
import java.util.List;

public class HibernateTest {
    private String jdbcUrl;

    @Before
    public void setup() {
        DbDeployerAppContext context = UnitTestDbBuilder.newBuilder()
                .setSourcePath("./src/main/database/myexample/final")
                .setReferenceEnvName("dev1")
                .setDbPlatform(new HsqlDbPlatform())  // you can override the platform in code, or do it in the XML as mentioned in option 1
                .setDbServer("inMemDbTest")  // setting this value is a shortcut to generate the JDBC url for this environment for you if not already specified
                .buildContext();

        context.setupEnvInfra();
        context.cleanEnvironment();
        context.deploy();

        jdbcUrl = context.getEnvironment().getJdbcUrl();
    }

    @Test
    public void hibtest() {
        SessionFactory sessionFactory = getSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();
        session.save(new AccountType(1, "C", "Checking Account"));
        session.getTransaction().commit();

        CriteriaQuery<AccountType> cr = session.getCriteriaBuilder().createQuery(AccountType.class);
        Root<AccountType> root = cr.from(AccountType.class);
        cr.select(root);
        Query<AccountType> query = session.createQuery(cr);
        for (AccountType account : query.getResultList()) {
            System.out.println(account.getDescription());
        }
        session.close();
    }


    private SessionFactory getSessionFactory() {
        MetadataSources metadataSources = new MetadataSources(new StandardServiceRegistryBuilder()
                .applySetting(Environment.DIALECT, HSQLDialect.class.getName())
                .applySetting(Environment.DRIVER, org.hsqldb.jdbc.JDBCDriver.class.getName())
                .applySetting(Environment.URL, jdbcUrl)
                .build()
        );

        List<Class<?>> modelClasses = getModelClasses();
        for (Class<?> modelClass : modelClasses) {
            metadataSources.addAnnotatedClass(modelClass);
        }

        return metadataSources.buildMetadata().buildSessionFactory();
    }

    static List<Class<?>> getModelClasses() {
        return Arrays.asList(
                Account.class,
                AccountType.class,
                Person.class,
                Country.class
        );
    }
}
