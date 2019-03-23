//// CHANGE name=change0
CREATE TABLE table423 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table423
    ADD CONSTRAINT table423_pkey PRIMARY KEY (id);



GO
