//// CHANGE name=change0
CREATE TABLE table227 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table227
    ADD CONSTRAINT table227_pkey PRIMARY KEY (id);



GO
