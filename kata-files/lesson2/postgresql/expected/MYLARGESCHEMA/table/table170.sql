//// CHANGE name=change0
CREATE TABLE table170 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table170
    ADD CONSTRAINT table170_pkey PRIMARY KEY (id);



GO
