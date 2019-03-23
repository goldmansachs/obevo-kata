//// CHANGE name=change0
CREATE TABLE table445 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table445
    ADD CONSTRAINT table445_pkey PRIMARY KEY (id);



GO
