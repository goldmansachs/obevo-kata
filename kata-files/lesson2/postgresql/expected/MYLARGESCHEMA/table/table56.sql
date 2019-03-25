//// CHANGE name=change0
CREATE TABLE table56 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table56
    ADD CONSTRAINT table56_pkey PRIMARY KEY (id);



GO
