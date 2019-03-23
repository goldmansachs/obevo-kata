//// CHANGE name=change0
CREATE TABLE table301 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table301
    ADD CONSTRAINT table301_pkey PRIMARY KEY (id);



GO
