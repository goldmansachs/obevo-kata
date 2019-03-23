//// CHANGE name=change0
CREATE TABLE table175 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table175
    ADD CONSTRAINT table175_pkey PRIMARY KEY (id);



GO
