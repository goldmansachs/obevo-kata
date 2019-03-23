//// CHANGE name=change0
CREATE TABLE table109 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table109
    ADD CONSTRAINT table109_pkey PRIMARY KEY (id);



GO
