//// CHANGE name=change0
CREATE TABLE table395 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table395
    ADD CONSTRAINT table395_pkey PRIMARY KEY (id);



GO
