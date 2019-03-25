//// CHANGE name=change0
CREATE TABLE table42 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table42
    ADD CONSTRAINT table42_pkey PRIMARY KEY (id);



GO
