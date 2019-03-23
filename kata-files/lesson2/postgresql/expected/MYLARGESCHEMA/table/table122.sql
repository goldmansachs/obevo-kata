//// CHANGE name=change0
CREATE TABLE table122 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table122
    ADD CONSTRAINT table122_pkey PRIMARY KEY (id);



GO
