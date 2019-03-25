//// CHANGE name=change0
CREATE TABLE table155 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table155
    ADD CONSTRAINT table155_pkey PRIMARY KEY (id);



GO
