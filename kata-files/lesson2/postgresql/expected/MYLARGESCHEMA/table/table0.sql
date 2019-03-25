//// CHANGE name=change0
CREATE TABLE table0 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table0
    ADD CONSTRAINT table0_pkey PRIMARY KEY (id);



GO
