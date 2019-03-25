//// CHANGE name=change0
CREATE TABLE table197 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table197
    ADD CONSTRAINT table197_pkey PRIMARY KEY (id);



GO
