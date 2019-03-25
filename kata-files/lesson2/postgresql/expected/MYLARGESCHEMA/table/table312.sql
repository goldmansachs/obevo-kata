//// CHANGE name=change0
CREATE TABLE table312 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table312
    ADD CONSTRAINT table312_pkey PRIMARY KEY (id);



GO
