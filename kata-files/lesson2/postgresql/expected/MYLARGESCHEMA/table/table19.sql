//// CHANGE name=change0
CREATE TABLE table19 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table19
    ADD CONSTRAINT table19_pkey PRIMARY KEY (id);



GO
