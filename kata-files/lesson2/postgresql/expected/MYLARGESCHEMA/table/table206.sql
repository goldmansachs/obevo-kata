//// CHANGE name=change0
CREATE TABLE table206 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table206
    ADD CONSTRAINT table206_pkey PRIMARY KEY (id);



GO
