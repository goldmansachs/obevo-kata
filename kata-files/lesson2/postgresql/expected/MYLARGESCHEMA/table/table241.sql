//// CHANGE name=change0
CREATE TABLE table241 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table241
    ADD CONSTRAINT table241_pkey PRIMARY KEY (id);



GO
