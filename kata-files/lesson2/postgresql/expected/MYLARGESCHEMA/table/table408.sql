//// CHANGE name=change0
CREATE TABLE table408 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table408
    ADD CONSTRAINT table408_pkey PRIMARY KEY (id);



GO
