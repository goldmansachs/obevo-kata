//// CHANGE name=change0
CREATE TABLE table69 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table69
    ADD CONSTRAINT table69_pkey PRIMARY KEY (id);



GO
