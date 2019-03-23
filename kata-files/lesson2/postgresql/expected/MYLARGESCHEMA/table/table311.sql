//// CHANGE name=change0
CREATE TABLE table311 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table311
    ADD CONSTRAINT table311_pkey PRIMARY KEY (id);



GO
