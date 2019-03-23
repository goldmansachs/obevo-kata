//// CHANGE name=change0
CREATE TABLE table41 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table41
    ADD CONSTRAINT table41_pkey PRIMARY KEY (id);



GO
