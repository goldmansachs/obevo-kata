//// CHANGE name=change0
CREATE TABLE table125 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table125
    ADD CONSTRAINT table125_pkey PRIMARY KEY (id);



GO
