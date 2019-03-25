//// CHANGE name=change0
CREATE TABLE table126 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table126
    ADD CONSTRAINT table126_pkey PRIMARY KEY (id);



GO
