//// CHANGE name=change0
CREATE TABLE table321 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table321
    ADD CONSTRAINT table321_pkey PRIMARY KEY (id);



GO
