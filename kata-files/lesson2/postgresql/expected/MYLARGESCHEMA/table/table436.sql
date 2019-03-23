//// CHANGE name=change0
CREATE TABLE table436 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table436
    ADD CONSTRAINT table436_pkey PRIMARY KEY (id);



GO
