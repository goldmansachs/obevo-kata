//// CHANGE name=change0
CREATE TABLE table148 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table148
    ADD CONSTRAINT table148_pkey PRIMARY KEY (id);



GO
