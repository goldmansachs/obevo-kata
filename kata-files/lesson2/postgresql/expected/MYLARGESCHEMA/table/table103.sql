//// CHANGE name=change0
CREATE TABLE table103 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table103
    ADD CONSTRAINT table103_pkey PRIMARY KEY (id);



GO
