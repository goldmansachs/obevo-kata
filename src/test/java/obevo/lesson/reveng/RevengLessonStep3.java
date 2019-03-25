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

import com.gs.obevo.dbmetadata.api.DaTable;
import org.junit.Test;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

public class RevengLessonStep3 extends RevengLessonBase {
    @Test
    public void verifyDevSchemaCreated() throws Exception {
        assertNotNull("Schema should be initialized", devDbCatalog);
        assertThat("Views have been created in dev",
                devDbCatalog.getTables().select(DaTable::isView).size(),
                equalTo(100));
        assertThat("Tables have been created in dev",
                devDbCatalog.getTables().reject(DaTable::isView)
                        .reject(tab -> tab.getName().toLowerCase().startsWith("artifact"))  // ignoring Obevo internal tables
                        .size(),
                equalTo(500));
    }
}
