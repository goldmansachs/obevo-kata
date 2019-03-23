//// CHANGE name=change0
CREATE TABLE table450 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table450
    ADD CONSTRAINT table450_pkey PRIMARY KEY (id);



GO
