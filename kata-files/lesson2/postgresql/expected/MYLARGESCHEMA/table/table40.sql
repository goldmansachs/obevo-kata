//// CHANGE name=change0
CREATE TABLE table40 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table40
    ADD CONSTRAINT table40_pkey PRIMARY KEY (id);



GO
