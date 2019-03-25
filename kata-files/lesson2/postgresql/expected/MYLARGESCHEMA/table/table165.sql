//// CHANGE name=change0
CREATE TABLE table165 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table165
    ADD CONSTRAINT table165_pkey PRIMARY KEY (id);



GO
