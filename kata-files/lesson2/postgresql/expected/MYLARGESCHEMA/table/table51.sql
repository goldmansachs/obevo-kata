//// CHANGE name=change0
CREATE TABLE table51 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table51
    ADD CONSTRAINT table51_pkey PRIMARY KEY (id);



GO
