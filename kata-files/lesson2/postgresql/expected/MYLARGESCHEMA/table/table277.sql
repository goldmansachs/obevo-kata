//// CHANGE name=change0
CREATE TABLE table277 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table277
    ADD CONSTRAINT table277_pkey PRIMARY KEY (id);



GO
