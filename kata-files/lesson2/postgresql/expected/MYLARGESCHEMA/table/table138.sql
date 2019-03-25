//// CHANGE name=change0
CREATE TABLE table138 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table138
    ADD CONSTRAINT table138_pkey PRIMARY KEY (id);



GO
