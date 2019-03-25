//// CHANGE name=change0
CREATE TABLE table252 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table252
    ADD CONSTRAINT table252_pkey PRIMARY KEY (id);



GO
