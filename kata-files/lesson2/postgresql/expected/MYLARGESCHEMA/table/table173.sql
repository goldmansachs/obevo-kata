//// CHANGE name=change0
CREATE TABLE table173 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table173
    ADD CONSTRAINT table173_pkey PRIMARY KEY (id);



GO
