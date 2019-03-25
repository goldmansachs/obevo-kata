//// CHANGE name=change0
CREATE TABLE table356 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table356
    ADD CONSTRAINT table356_pkey PRIMARY KEY (id);



GO
