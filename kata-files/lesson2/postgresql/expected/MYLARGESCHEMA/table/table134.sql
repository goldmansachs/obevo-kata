//// CHANGE name=change0
CREATE TABLE table134 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table134
    ADD CONSTRAINT table134_pkey PRIMARY KEY (id);



GO
