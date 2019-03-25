//// CHANGE name=change0
CREATE TABLE table187 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table187
    ADD CONSTRAINT table187_pkey PRIMARY KEY (id);



GO
