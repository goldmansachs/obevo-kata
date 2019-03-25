//// CHANGE name=change0
CREATE TABLE table284 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table284
    ADD CONSTRAINT table284_pkey PRIMARY KEY (id);



GO
