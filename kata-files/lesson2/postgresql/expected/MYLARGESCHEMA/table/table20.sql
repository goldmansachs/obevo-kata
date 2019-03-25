//// CHANGE name=change0
CREATE TABLE table20 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table20
    ADD CONSTRAINT table20_pkey PRIMARY KEY (id);



GO
