//// CHANGE name=change0
CREATE TABLE table92 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table92
    ADD CONSTRAINT table92_pkey PRIMARY KEY (id);



GO
