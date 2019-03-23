//// CHANGE name=change0
CREATE TABLE table292 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table292
    ADD CONSTRAINT table292_pkey PRIMARY KEY (id);



GO
