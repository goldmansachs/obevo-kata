//// CHANGE name=change0
CREATE TABLE table83 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table83
    ADD CONSTRAINT table83_pkey PRIMARY KEY (id);



GO
