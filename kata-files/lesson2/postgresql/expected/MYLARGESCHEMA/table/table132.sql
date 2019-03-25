//// CHANGE name=change0
CREATE TABLE table132 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table132
    ADD CONSTRAINT table132_pkey PRIMARY KEY (id);



GO
