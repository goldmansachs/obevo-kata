--
-- Copyright 2017 Goldman Sachs.
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.
--
DROP SCHEMA DEMO_SCHEMA CASCADE;
CREATE SCHEMA DEMO_SCHEMA;
CREATE USER RO_USER1 WITH PASSWORD 'p1';
CREATE USER RW_USER2 WITH PASSWORD 'p2';
CREATE USER SUPERUSER PASSWORD 'super';
CREATE ROLE RW_GROUP NOLOGIN;
CREATE ROLE RO_GROUP1 NOLOGIN;
CREATE ROLE RO_GROUP2 NOLOGIN;
GRANT RO_GROUP1 TO RO_USER1;
GRANT RW_GROUP TO RW_USER2;