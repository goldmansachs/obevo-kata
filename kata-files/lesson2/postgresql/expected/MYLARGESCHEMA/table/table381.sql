//// CHANGE name=change0
CREATE TABLE table381 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table381
    ADD CONSTRAINT table381_pkey PRIMARY KEY (id);



GO
