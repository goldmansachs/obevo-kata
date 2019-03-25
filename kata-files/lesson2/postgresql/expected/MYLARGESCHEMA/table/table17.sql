//// CHANGE name=change0
CREATE TABLE table17 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table17
    ADD CONSTRAINT table17_pkey PRIMARY KEY (id);



GO
