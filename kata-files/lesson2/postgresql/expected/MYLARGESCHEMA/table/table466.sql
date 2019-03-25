//// CHANGE name=change0
CREATE TABLE table466 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table466
    ADD CONSTRAINT table466_pkey PRIMARY KEY (id);



GO
