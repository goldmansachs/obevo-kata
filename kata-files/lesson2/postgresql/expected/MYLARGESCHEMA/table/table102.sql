//// CHANGE name=change0
CREATE TABLE table102 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table102
    ADD CONSTRAINT table102_pkey PRIMARY KEY (id);



GO
