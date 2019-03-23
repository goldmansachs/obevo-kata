//// CHANGE name=change0
CREATE TABLE table178 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table178
    ADD CONSTRAINT table178_pkey PRIMARY KEY (id);



GO
