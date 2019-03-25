//// CHANGE name=change0
CREATE TABLE table468 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table468
    ADD CONSTRAINT table468_pkey PRIMARY KEY (id);



GO
