//// CHANGE name=change0
CREATE TABLE table46 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table46
    ADD CONSTRAINT table46_pkey PRIMARY KEY (id);



GO
