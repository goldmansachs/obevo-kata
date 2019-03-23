//// CHANGE name=change0
CREATE TABLE table256 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table256
    ADD CONSTRAINT table256_pkey PRIMARY KEY (id);



GO
