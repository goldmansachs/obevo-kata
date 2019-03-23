//// CHANGE name=change0
CREATE TABLE table479 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table479
    ADD CONSTRAINT table479_pkey PRIMARY KEY (id);



GO
