//// CHANGE name=change0
CREATE TABLE table157 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table157
    ADD CONSTRAINT table157_pkey PRIMARY KEY (id);



GO
