//// CHANGE name=change0
CREATE TABLE table497 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table497
    ADD CONSTRAINT table497_pkey PRIMARY KEY (id);



GO
