//// CHANGE name=change0
CREATE TABLE table240 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table240
    ADD CONSTRAINT table240_pkey PRIMARY KEY (id);



GO
