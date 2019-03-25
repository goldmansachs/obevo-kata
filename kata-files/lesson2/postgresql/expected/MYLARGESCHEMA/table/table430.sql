//// CHANGE name=change0
CREATE TABLE table430 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table430
    ADD CONSTRAINT table430_pkey PRIMARY KEY (id);



GO
