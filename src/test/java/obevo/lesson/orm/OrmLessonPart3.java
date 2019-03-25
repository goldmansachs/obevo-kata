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
import com.gs.obevo.db.apps.baselineutil.BaselineValidatorMain;
import com.gs.obevo.db.impl.platforms.hsql.HsqlDbPlatform;
import com.gs.obevo.db.unittest.UnitTestDbBuilder;
import org.junit.Test;

public class OrmLessonPart3 {
    @Test
    public void verifyNoBaselineBreaks() {
        DbDeployerAppContext appContext = UnitTestDbBuilder.newBuilder()
                .setSourcePath("./src/main/database/lesson/orm/final")
                .setReferenceEnvName("dev1")
                .setDbPlatform(new HsqlDbPlatform())  // you can override the platform in code, or do it in the XML as mentioned in option 1
                .setDbServer("inMemDbTest")  // setting this value is a shortcut to generate the JDBC url for this environment for you if not already specified
                .buildContext();

        BaselineValidatorMain main = new BaselineValidatorMain();
        main.validateNoBaselineBreaks(appContext);
    }
}
