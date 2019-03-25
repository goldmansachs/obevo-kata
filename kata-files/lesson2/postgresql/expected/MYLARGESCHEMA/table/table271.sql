//// CHANGE name=change0
CREATE TABLE table271 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table271
    ADD CONSTRAINT table271_pkey PRIMARY KEY (id);



GO
