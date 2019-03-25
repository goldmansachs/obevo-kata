//// CHANGE name=change0
CREATE TABLE table320 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table320
    ADD CONSTRAINT table320_pkey PRIMARY KEY (id);



GO
