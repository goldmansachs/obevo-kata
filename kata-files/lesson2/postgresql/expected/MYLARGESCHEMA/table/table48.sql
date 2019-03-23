//// CHANGE name=change0
CREATE TABLE table48 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table48
    ADD CONSTRAINT table48_pkey PRIMARY KEY (id);



GO
