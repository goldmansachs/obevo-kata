//// CHANGE name=change0
CREATE TABLE table31 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table31
    ADD CONSTRAINT table31_pkey PRIMARY KEY (id);



GO
