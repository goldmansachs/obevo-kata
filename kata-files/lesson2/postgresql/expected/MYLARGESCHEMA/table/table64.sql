//// CHANGE name=change0
CREATE TABLE table64 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table64
    ADD CONSTRAINT table64_pkey PRIMARY KEY (id);



GO
