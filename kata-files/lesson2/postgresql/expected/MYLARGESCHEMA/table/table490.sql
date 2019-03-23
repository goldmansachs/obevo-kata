//// CHANGE name=change0
CREATE TABLE table490 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table490
    ADD CONSTRAINT table490_pkey PRIMARY KEY (id);



GO
