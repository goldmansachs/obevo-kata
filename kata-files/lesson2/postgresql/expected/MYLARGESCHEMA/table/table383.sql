//// CHANGE name=change0
CREATE TABLE table383 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table383
    ADD CONSTRAINT table383_pkey PRIMARY KEY (id);



GO
