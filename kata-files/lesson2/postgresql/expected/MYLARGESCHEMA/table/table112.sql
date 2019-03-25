//// CHANGE name=change0
CREATE TABLE table112 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table112
    ADD CONSTRAINT table112_pkey PRIMARY KEY (id);



GO
