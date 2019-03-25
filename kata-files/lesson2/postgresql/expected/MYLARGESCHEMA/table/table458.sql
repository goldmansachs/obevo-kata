//// CHANGE name=change0
CREATE TABLE table458 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table458
    ADD CONSTRAINT table458_pkey PRIMARY KEY (id);



GO
