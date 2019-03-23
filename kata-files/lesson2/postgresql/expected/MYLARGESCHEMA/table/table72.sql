//// CHANGE name=change0
CREATE TABLE table72 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table72
    ADD CONSTRAINT table72_pkey PRIMARY KEY (id);



GO
