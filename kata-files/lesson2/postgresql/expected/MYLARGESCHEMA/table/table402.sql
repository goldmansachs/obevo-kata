//// CHANGE name=change0
CREATE TABLE table402 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table402
    ADD CONSTRAINT table402_pkey PRIMARY KEY (id);



GO
