//// CHANGE name=change0
CREATE TABLE table156 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table156
    ADD CONSTRAINT table156_pkey PRIMARY KEY (id);



GO
