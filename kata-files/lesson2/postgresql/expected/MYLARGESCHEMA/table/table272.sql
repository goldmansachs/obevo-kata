//// CHANGE name=change0
CREATE TABLE table272 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table272
    ADD CONSTRAINT table272_pkey PRIMARY KEY (id);



GO
