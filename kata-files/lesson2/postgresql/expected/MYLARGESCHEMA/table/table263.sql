//// CHANGE name=change0
CREATE TABLE table263 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table263
    ADD CONSTRAINT table263_pkey PRIMARY KEY (id);



GO
