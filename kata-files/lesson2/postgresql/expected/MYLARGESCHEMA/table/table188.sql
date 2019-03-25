//// CHANGE name=change0
CREATE TABLE table188 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table188
    ADD CONSTRAINT table188_pkey PRIMARY KEY (id);



GO
