//// CHANGE name=change0
CREATE TABLE table117 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table117
    ADD CONSTRAINT table117_pkey PRIMARY KEY (id);



GO
