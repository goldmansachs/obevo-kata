//// CHANGE name=change0
CREATE TABLE table303 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table303
    ADD CONSTRAINT table303_pkey PRIMARY KEY (id);



GO
