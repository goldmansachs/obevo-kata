//// CHANGE name=change0
CREATE TABLE table191 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table191
    ADD CONSTRAINT table191_pkey PRIMARY KEY (id);



GO
