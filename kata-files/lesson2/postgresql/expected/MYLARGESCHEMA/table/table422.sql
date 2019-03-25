//// CHANGE name=change0
CREATE TABLE table422 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table422
    ADD CONSTRAINT table422_pkey PRIMARY KEY (id);



GO
