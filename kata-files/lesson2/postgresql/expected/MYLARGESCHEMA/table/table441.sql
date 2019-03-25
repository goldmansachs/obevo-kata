//// CHANGE name=change0
CREATE TABLE table441 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table441
    ADD CONSTRAINT table441_pkey PRIMARY KEY (id);



GO
