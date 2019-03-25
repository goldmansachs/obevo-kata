//// CHANGE name=change0
CREATE TABLE table495 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table495
    ADD CONSTRAINT table495_pkey PRIMARY KEY (id);



GO
