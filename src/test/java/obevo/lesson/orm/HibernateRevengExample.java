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

import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.hibernate.HibernateReveng;
import com.gs.obevo.hibernate.HibernateRevengArgs;
import com.gs.obevo.hibernate.HibernateRevengFactory;
import org.hibernate.dialect.PostgreSQL95Dialect;

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
                PostgreSQL95Dialect.class,
                HibernateTest.getModelClasses()
        ).withGenerateBaseline(true));
    }
}
