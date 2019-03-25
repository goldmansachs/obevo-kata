//// CHANGE name=change0
CREATE TABLE table3 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table3
    ADD CONSTRAINT table3_pkey PRIMARY KEY (id);



GO
