//// CHANGE name=change0
CREATE TABLE table396 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table396
    ADD CONSTRAINT table396_pkey PRIMARY KEY (id);



GO
