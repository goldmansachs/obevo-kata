//// CHANGE name=change0
CREATE TABLE table107 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table107
    ADD CONSTRAINT table107_pkey PRIMARY KEY (id);



GO
