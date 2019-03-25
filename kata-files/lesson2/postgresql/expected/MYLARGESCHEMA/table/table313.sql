//// CHANGE name=change0
CREATE TABLE table313 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table313
    ADD CONSTRAINT table313_pkey PRIMARY KEY (id);



GO
