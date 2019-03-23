//// CHANGE name=change0
CREATE TABLE table293 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table293
    ADD CONSTRAINT table293_pkey PRIMARY KEY (id);



GO
