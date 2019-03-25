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
package obevo.lesson.orm;

import com.gs.obevo.db.api.platform.DbDeployerAppContext;
import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.db.unittest.UnitTestDbBuilder;
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
                .setSourcePath("./src/main/database/lesson/orm/final")
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
