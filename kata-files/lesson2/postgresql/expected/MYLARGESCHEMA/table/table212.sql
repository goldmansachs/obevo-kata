//// CHANGE name=change0
CREATE TABLE table212 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table212
    ADD CONSTRAINT table212_pkey PRIMARY KEY (id);



GO
