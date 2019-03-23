//// CHANGE name=change0
CREATE TABLE table114 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table114
    ADD CONSTRAINT table114_pkey PRIMARY KEY (id);



GO
