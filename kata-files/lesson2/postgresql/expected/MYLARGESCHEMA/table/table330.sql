//// CHANGE name=change0
CREATE TABLE table330 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table330
    ADD CONSTRAINT table330_pkey PRIMARY KEY (id);



GO
