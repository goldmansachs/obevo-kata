//// CHANGE name=change0
CREATE TABLE table270 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table270
    ADD CONSTRAINT table270_pkey PRIMARY KEY (id);



GO
