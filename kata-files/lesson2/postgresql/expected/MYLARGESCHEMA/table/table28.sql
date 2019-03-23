//// CHANGE name=change0
CREATE TABLE table28 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table28
    ADD CONSTRAINT table28_pkey PRIMARY KEY (id);



GO
