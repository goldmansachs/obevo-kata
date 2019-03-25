//// CHANGE name=change0
CREATE TABLE table296 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table296
    ADD CONSTRAINT table296_pkey PRIMARY KEY (id);



GO
