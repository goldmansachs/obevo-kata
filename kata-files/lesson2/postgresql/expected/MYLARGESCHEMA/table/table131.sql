//// CHANGE name=change0
CREATE TABLE table131 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table131
    ADD CONSTRAINT table131_pkey PRIMARY KEY (id);



GO
