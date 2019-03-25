//// CHANGE name=change0
CREATE TABLE table299 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table299
    ADD CONSTRAINT table299_pkey PRIMARY KEY (id);



GO
