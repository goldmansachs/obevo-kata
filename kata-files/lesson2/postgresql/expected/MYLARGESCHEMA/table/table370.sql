//// CHANGE name=change0
CREATE TABLE table370 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table370
    ADD CONSTRAINT table370_pkey PRIMARY KEY (id);



GO
