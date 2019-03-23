//// CHANGE name=change0
CREATE TABLE table250 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table250
    ADD CONSTRAINT table250_pkey PRIMARY KEY (id);



GO
