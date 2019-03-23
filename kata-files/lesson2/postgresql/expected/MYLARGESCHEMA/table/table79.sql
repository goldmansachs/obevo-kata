//// CHANGE name=change0
CREATE TABLE table79 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table79
    ADD CONSTRAINT table79_pkey PRIMARY KEY (id);



GO
