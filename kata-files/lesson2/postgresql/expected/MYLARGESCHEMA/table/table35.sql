//// CHANGE name=change0
CREATE TABLE table35 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table35
    ADD CONSTRAINT table35_pkey PRIMARY KEY (id);



GO
