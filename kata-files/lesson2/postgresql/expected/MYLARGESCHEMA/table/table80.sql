//// CHANGE name=change0
CREATE TABLE table80 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table80
    ADD CONSTRAINT table80_pkey PRIMARY KEY (id);



GO
