//// CHANGE name=change0
CREATE TABLE table476 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table476
    ADD CONSTRAINT table476_pkey PRIMARY KEY (id);



GO
