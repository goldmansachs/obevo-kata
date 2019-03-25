//// CHANGE name=change0
CREATE TABLE table459 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table459
    ADD CONSTRAINT table459_pkey PRIMARY KEY (id);



GO
