//// CHANGE name=change0
CREATE TABLE table499 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table499
    ADD CONSTRAINT table499_pkey PRIMARY KEY (id);



GO
