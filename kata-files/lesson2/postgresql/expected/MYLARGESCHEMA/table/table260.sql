//// CHANGE name=change0
CREATE TABLE table260 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table260
    ADD CONSTRAINT table260_pkey PRIMARY KEY (id);



GO
