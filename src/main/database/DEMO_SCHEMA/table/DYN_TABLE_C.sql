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

//// CHANGE name=chng1
CREATE TABLE DYN_TABLE_C (
	C_ID    INT	NOT NULL,
	D_ID    INT	NOT NULL,
	STRING_FIELD	VARCHAR(30)	NULL,
	TIMESTAMP_FIELD	TIMESTAMP	NULL,
    PRIMARY KEY (C_ID)
)
GO

//// CHANGE FK name=chng2
ALTER TABLE DYN_TABLE_C ADD FOREIGN KEY (D_ID) REFERENCES DYN_TABLE_D(D_ID)
GO
