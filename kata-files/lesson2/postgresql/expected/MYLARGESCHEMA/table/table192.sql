//// CHANGE name=change0
CREATE TABLE table192 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table192
    ADD CONSTRAINT table192_pkey PRIMARY KEY (id);



GO
