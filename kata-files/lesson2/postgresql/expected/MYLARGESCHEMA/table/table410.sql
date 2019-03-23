//// CHANGE name=change0
CREATE TABLE table410 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table410
    ADD CONSTRAINT table410_pkey PRIMARY KEY (id);



GO
