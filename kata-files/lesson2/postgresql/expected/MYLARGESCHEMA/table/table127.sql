//// CHANGE name=change0
CREATE TABLE table127 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table127
    ADD CONSTRAINT table127_pkey PRIMARY KEY (id);



GO
