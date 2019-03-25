//// CHANGE name=change0
CREATE TABLE table393 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table393
    ADD CONSTRAINT table393_pkey PRIMARY KEY (id);



GO
