//// CHANGE name=change0
CREATE TABLE table93 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table93
    ADD CONSTRAINT table93_pkey PRIMARY KEY (id);



GO
