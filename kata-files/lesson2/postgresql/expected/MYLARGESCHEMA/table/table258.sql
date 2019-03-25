//// CHANGE name=change0
CREATE TABLE table258 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table258
    ADD CONSTRAINT table258_pkey PRIMARY KEY (id);



GO
