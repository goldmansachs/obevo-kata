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

import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.hamcrest.Matchers;
import org.junit.Test;

import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.lessThan;
import static org.junit.Assert.assertThat;

public class RevengLessonStep5 extends RevengLessonBase {
    @Test
    public void verifyInit() throws Exception {
        assertThat("Verify that the latest deployment only had 2 changes",
                jdbc.query("select count(*) from mylargeschema.artifactdeployment where updatedeployid = (select max(id) from mylargeschema.artifactexecution)", new ScalarHandler<>(1)),
                Matchers.<Long>allOf(greaterThanOrEqualTo(2L), lessThan(100L))
        );
    }
}
