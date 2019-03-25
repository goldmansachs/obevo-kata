//// CHANGE name=change0
CREATE TABLE table427 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table427
    ADD CONSTRAINT table427_pkey PRIMARY KEY (id);



GO
