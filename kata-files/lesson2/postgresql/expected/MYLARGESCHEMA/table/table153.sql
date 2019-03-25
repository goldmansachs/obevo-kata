//// CHANGE name=change0
CREATE TABLE table153 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table153
    ADD CONSTRAINT table153_pkey PRIMARY KEY (id);



GO
