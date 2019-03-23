//// CHANGE name=change0
CREATE TABLE table405 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table405
    ADD CONSTRAINT table405_pkey PRIMARY KEY (id);



GO
