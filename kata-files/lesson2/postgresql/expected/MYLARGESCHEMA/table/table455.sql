//// CHANGE name=change0
CREATE TABLE table455 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table455
    ADD CONSTRAINT table455_pkey PRIMARY KEY (id);



GO
