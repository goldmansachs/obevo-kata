//// CHANGE name=change0
CREATE TABLE table341 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table341
    ADD CONSTRAINT table341_pkey PRIMARY KEY (id);



GO
