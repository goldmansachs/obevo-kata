//// CHANGE name=change0
CREATE TABLE table367 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table367
    ADD CONSTRAINT table367_pkey PRIMARY KEY (id);



GO
