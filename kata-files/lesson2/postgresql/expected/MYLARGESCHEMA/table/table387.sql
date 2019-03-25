//// CHANGE name=change0
CREATE TABLE table387 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table387
    ADD CONSTRAINT table387_pkey PRIMARY KEY (id);



GO
