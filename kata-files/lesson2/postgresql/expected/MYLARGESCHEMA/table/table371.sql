//// CHANGE name=change0
CREATE TABLE table371 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table371
    ADD CONSTRAINT table371_pkey PRIMARY KEY (id);



GO
