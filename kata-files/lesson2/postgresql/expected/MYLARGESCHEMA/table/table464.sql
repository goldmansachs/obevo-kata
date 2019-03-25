//// CHANGE name=change0
CREATE TABLE table464 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table464
    ADD CONSTRAINT table464_pkey PRIMARY KEY (id);



GO
