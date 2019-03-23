//// CHANGE name=change0
CREATE TABLE table382 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table382
    ADD CONSTRAINT table382_pkey PRIMARY KEY (id);



GO
