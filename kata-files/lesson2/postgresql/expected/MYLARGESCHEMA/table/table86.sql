//// CHANGE name=change0
CREATE TABLE table86 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table86
    ADD CONSTRAINT table86_pkey PRIMARY KEY (id);



GO
