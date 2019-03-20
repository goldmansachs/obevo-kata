package obevo.kata.orm;

import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.hibernate.HibernateReveng;
import com.gs.obevo.hibernate.HibernateRevengArgs;
import com.gs.obevo.hibernate.HibernateRevengFactory;
import org.hibernate.dialect.HSQLDialect;

import java.io.File;
import java.util.List;

public class HibernateRevengExample {
    public static void main(String[] args) {
        new HibernateRevengExample().reverseEngineer();
    }

    private void reverseEngineer() {
        HibernateReveng<List<? extends Class<?>>> hibReveng = HibernateRevengFactory.getInstance().getHibernate5();
        hibReveng.executeReveng(new HibernateRevengArgs<List<? extends Class<?>>>(
                "company",
                new File("./src/main/database/myexample"),
                new HsqlDbPlatform(),
                HSQLDialect.class,
                HibernateTest.getModelClasses()
        ).withGenerateBaseline(true));
    }
}
