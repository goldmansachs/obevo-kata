//// CHANGE name=change0
CREATE TABLE table471 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table471
    ADD CONSTRAINT table471_pkey PRIMARY KEY (id);



GO
