//// CHANGE name=change0
CREATE TABLE table467 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table467
    ADD CONSTRAINT table467_pkey PRIMARY KEY (id);



GO
