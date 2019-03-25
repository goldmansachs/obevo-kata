//// CHANGE name=change0
CREATE TABLE table5 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table5
    ADD CONSTRAINT table5_pkey PRIMARY KEY (id);



GO
