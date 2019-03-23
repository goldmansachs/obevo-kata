//// CHANGE name=change0
CREATE TABLE table18 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table18
    ADD CONSTRAINT table18_pkey PRIMARY KEY (id);



GO
