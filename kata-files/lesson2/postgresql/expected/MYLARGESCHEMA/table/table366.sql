//// CHANGE name=change0
CREATE TABLE table366 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table366
    ADD CONSTRAINT table366_pkey PRIMARY KEY (id);



GO
