//// CHANGE name=change0
CREATE TABLE table487 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table487
    ADD CONSTRAINT table487_pkey PRIMARY KEY (id);



GO
