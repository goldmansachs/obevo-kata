//// CHANGE name=change0
CREATE TABLE table463 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table463
    ADD CONSTRAINT table463_pkey PRIMARY KEY (id);



GO
