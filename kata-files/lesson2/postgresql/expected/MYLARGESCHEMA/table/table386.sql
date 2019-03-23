//// CHANGE name=change0
CREATE TABLE table386 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table386
    ADD CONSTRAINT table386_pkey PRIMARY KEY (id);



GO
