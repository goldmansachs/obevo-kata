//// CHANGE name=change0
CREATE TABLE table220 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table220
    ADD CONSTRAINT table220_pkey PRIMARY KEY (id);



GO
