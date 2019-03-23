//// CHANGE name=change0
CREATE TABLE table221 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table221
    ADD CONSTRAINT table221_pkey PRIMARY KEY (id);



GO
