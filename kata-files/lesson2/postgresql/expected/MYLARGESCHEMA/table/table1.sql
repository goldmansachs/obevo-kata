//// CHANGE name=change0
CREATE TABLE table1 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (id);



GO
