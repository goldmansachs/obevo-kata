//// CHANGE name=change0
CREATE TABLE table336 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table336
    ADD CONSTRAINT table336_pkey PRIMARY KEY (id);



GO
