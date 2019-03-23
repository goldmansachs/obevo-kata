//// CHANGE name=change0
CREATE TABLE table357 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table357
    ADD CONSTRAINT table357_pkey PRIMARY KEY (id);



GO
