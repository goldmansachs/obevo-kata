//// CHANGE name=change0
CREATE TABLE table161 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table161
    ADD CONSTRAINT table161_pkey PRIMARY KEY (id);



GO
