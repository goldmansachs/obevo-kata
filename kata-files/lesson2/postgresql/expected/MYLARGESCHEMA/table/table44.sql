//// CHANGE name=change0
CREATE TABLE table44 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table44
    ADD CONSTRAINT table44_pkey PRIMARY KEY (id);



GO
