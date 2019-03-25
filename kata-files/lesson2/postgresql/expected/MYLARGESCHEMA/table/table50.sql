//// CHANGE name=change0
CREATE TABLE table50 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table50
    ADD CONSTRAINT table50_pkey PRIMARY KEY (id);



GO
