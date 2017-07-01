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

CREATE TABLE TABLE_A (
	A_ID    INT	NOT NULL,
	B_ID    INT	NOT NULL,
	C_ID    INT	NULL,
	EXTRA3    INT	NULL,
	MYNEWCOL    INT	NULL,
	${tableAStringFieldName}	VARCHAR(30)	NULL,
	TIMESTAMP_FIELD	TIMESTAMP	NULL,
    PRIMARY KEY (A_ID)
)
GO
ALTER TABLE TABLE_A ADD FOREIGN KEY (B_ID) REFERENCES TABLE_B(B_ID)
GO
