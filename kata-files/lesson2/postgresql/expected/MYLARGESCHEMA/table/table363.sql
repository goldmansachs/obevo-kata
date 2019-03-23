//// CHANGE name=change0
CREATE TABLE table363 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table363
    ADD CONSTRAINT table363_pkey PRIMARY KEY (id);



GO
