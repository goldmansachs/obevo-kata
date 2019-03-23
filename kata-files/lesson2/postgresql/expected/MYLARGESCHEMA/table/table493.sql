//// CHANGE name=change0
CREATE TABLE table493 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table493
    ADD CONSTRAINT table493_pkey PRIMARY KEY (id);



GO
