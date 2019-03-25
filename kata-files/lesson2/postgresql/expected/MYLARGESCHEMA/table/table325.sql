//// CHANGE name=change0
CREATE TABLE table325 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table325
    ADD CONSTRAINT table325_pkey PRIMARY KEY (id);



GO
