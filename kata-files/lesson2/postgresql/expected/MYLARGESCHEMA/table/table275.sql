//// CHANGE name=change0
CREATE TABLE table275 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table275
    ADD CONSTRAINT table275_pkey PRIMARY KEY (id);



GO
