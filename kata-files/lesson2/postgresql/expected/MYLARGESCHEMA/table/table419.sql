//// CHANGE name=change0
CREATE TABLE table419 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table419
    ADD CONSTRAINT table419_pkey PRIMARY KEY (id);



GO
