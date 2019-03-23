//// CHANGE name=change0
CREATE TABLE table295 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table295
    ADD CONSTRAINT table295_pkey PRIMARY KEY (id);



GO
