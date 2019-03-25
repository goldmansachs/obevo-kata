//// CHANGE name=change0
CREATE TABLE table397 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table397
    ADD CONSTRAINT table397_pkey PRIMARY KEY (id);



GO
