====
    Copyright 2017 Goldman Sachs.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
====

change 1 - we add a row to table_b.
change 2 - We delete view1 and sp1, change view2 and sp2, keep sp3 and view3 the same, and add sp4 and view4
change 3 - in Table A, we roll back one change, inactivate another change, and add a new one

What is rollback and inactivation?
* Generally, Obevo will not support the idea of rolling back changes in production
** We prefer to only "roll-forward", i.e. apply another change to correct this, or to have changes be
backwards-compatible, e.g. only add nullable columns
* However, in qa/uat, it is a different story, as we have to correct things more often
* Hence, we support two functionalities to handle two use cases
* 1) rollback
** Use this in case you definitely need to correct something and do not need to preserve the 
old change, e.g. a newly introduced column in QA needs to have its length altered
** The rollback will apply if you deploy your code to an environment that already had this
change deployed. If the target env does not have this change, then this is simply ignored
* 2) inactivation
** Another case is that you have deployed a change to qa/uat, but find that you need to delay
this change for one release - however, you don't want to necessarily roll it back
** The inactivation feature allows the change to be left in existing environments but not 
deployed to any environments that do not have this change yet
 