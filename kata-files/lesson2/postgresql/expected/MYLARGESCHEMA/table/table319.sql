//// CHANGE name=change0
CREATE TABLE table319 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table319
    ADD CONSTRAINT table319_pkey PRIMARY KEY (id);



GO
