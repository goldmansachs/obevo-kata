//// CHANGE name=change0
CREATE TABLE table61 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table61
    ADD CONSTRAINT table61_pkey PRIMARY KEY (id);



GO
