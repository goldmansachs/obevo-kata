//// CHANGE name=change0
CREATE TABLE table100 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table100
    ADD CONSTRAINT table100_pkey PRIMARY KEY (id);



GO
