//// CHANGE name=change0
CREATE TABLE table309 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table309
    ADD CONSTRAINT table309_pkey PRIMARY KEY (id);



GO
