//// CHANGE name=change0
CREATE TABLE table167 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table167
    ADD CONSTRAINT table167_pkey PRIMARY KEY (id);



GO
