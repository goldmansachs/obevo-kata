//// CHANGE name=change0
CREATE TABLE table439 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table439
    ADD CONSTRAINT table439_pkey PRIMARY KEY (id);



GO
