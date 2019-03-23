//// CHANGE name=change0
CREATE TABLE table203 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table203
    ADD CONSTRAINT table203_pkey PRIMARY KEY (id);



GO
