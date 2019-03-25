//// CHANGE name=change0
CREATE TABLE table119 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table119
    ADD CONSTRAINT table119_pkey PRIMARY KEY (id);



GO
