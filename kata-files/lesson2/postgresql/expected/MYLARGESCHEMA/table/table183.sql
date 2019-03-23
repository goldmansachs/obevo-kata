//// CHANGE name=change0
CREATE TABLE table183 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table183
    ADD CONSTRAINT table183_pkey PRIMARY KEY (id);



GO
