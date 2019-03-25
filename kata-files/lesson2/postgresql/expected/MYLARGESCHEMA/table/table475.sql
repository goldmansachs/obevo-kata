//// CHANGE name=change0
CREATE TABLE table475 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table475
    ADD CONSTRAINT table475_pkey PRIMARY KEY (id);



GO
