//// CHANGE name=change0
CREATE TABLE table181 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table181
    ADD CONSTRAINT table181_pkey PRIMARY KEY (id);



GO
