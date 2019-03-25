//// CHANGE name=change0
CREATE TABLE table244 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table244
    ADD CONSTRAINT table244_pkey PRIMARY KEY (id);



GO
