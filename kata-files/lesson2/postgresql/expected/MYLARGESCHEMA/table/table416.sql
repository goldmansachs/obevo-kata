//// CHANGE name=change0
CREATE TABLE table416 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table416
    ADD CONSTRAINT table416_pkey PRIMARY KEY (id);



GO
