//// CHANGE name=change0
CREATE TABLE table15 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table15
    ADD CONSTRAINT table15_pkey PRIMARY KEY (id);



GO
