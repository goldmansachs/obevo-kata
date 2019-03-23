//// CHANGE name=change0
CREATE TABLE table21 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table21
    ADD CONSTRAINT table21_pkey PRIMARY KEY (id);



GO
