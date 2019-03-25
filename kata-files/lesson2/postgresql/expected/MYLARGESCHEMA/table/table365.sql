//// CHANGE name=change0
CREATE TABLE table365 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table365
    ADD CONSTRAINT table365_pkey PRIMARY KEY (id);



GO
