//// CHANGE name=change0
CREATE TABLE table91 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table91
    ADD CONSTRAINT table91_pkey PRIMARY KEY (id);



GO
