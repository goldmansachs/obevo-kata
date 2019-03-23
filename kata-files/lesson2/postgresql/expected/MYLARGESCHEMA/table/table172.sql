//// CHANGE name=change0
CREATE TABLE table172 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table172
    ADD CONSTRAINT table172_pkey PRIMARY KEY (id);



GO
