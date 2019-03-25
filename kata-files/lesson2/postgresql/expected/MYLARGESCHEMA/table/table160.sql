//// CHANGE name=change0
CREATE TABLE table160 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table160
    ADD CONSTRAINT table160_pkey PRIMARY KEY (id);



GO
