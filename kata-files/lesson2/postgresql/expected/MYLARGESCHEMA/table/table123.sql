//// CHANGE name=change0
CREATE TABLE table123 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table123
    ADD CONSTRAINT table123_pkey PRIMARY KEY (id);



GO
