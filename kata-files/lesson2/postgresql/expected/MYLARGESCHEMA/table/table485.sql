//// CHANGE name=change0
CREATE TABLE table485 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table485
    ADD CONSTRAINT table485_pkey PRIMARY KEY (id);



GO
