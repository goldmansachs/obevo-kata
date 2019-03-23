//// CHANGE name=change0
CREATE TABLE table217 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table217
    ADD CONSTRAINT table217_pkey PRIMARY KEY (id);



GO
