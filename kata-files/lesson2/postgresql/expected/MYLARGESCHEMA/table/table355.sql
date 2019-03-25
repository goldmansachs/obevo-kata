//// CHANGE name=change0
CREATE TABLE table355 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table355
    ADD CONSTRAINT table355_pkey PRIMARY KEY (id);



GO
