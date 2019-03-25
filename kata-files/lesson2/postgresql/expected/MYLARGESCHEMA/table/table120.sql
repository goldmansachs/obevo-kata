//// CHANGE name=change0
CREATE TABLE table120 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table120
    ADD CONSTRAINT table120_pkey PRIMARY KEY (id);



GO
