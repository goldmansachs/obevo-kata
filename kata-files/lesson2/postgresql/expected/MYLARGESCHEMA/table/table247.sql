//// CHANGE name=change0
CREATE TABLE table247 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table247
    ADD CONSTRAINT table247_pkey PRIMARY KEY (id);



GO
