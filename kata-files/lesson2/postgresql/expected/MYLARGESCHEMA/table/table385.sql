//// CHANGE name=change0
CREATE TABLE table385 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table385
    ADD CONSTRAINT table385_pkey PRIMARY KEY (id);



GO
