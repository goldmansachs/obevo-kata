//// CHANGE name=change0
CREATE TABLE table431 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table431
    ADD CONSTRAINT table431_pkey PRIMARY KEY (id);



GO
