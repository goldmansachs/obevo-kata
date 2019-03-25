//// CHANGE name=change0
CREATE TABLE table454 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table454
    ADD CONSTRAINT table454_pkey PRIMARY KEY (id);



GO
