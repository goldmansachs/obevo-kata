//// CHANGE name=change0
CREATE TABLE table251 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table251
    ADD CONSTRAINT table251_pkey PRIMARY KEY (id);



GO
