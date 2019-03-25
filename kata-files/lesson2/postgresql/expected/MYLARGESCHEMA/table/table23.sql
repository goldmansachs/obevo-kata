//// CHANGE name=change0
CREATE TABLE table23 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table23
    ADD CONSTRAINT table23_pkey PRIMARY KEY (id);



GO
