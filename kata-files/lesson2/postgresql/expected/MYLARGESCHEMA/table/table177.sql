//// CHANGE name=change0
CREATE TABLE table177 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table177
    ADD CONSTRAINT table177_pkey PRIMARY KEY (id);



GO
