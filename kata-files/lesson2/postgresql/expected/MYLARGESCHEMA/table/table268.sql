//// CHANGE name=change0
CREATE TABLE table268 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table268
    ADD CONSTRAINT table268_pkey PRIMARY KEY (id);



GO
