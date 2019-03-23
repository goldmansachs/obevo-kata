//// CHANGE name=change0
CREATE TABLE table95 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table95
    ADD CONSTRAINT table95_pkey PRIMARY KEY (id);



GO
