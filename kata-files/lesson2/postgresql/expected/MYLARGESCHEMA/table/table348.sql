//// CHANGE name=change0
CREATE TABLE table348 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table348
    ADD CONSTRAINT table348_pkey PRIMARY KEY (id);



GO
