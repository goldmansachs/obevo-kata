//// CHANGE name=change0
CREATE TABLE table273 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table273
    ADD CONSTRAINT table273_pkey PRIMARY KEY (id);



GO
