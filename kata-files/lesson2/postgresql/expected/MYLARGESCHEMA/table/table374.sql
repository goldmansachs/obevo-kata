//// CHANGE name=change0
CREATE TABLE table374 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table374
    ADD CONSTRAINT table374_pkey PRIMARY KEY (id);



GO
