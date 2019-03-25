//// CHANGE name=change0
CREATE TABLE table97 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table97
    ADD CONSTRAINT table97_pkey PRIMARY KEY (id);



GO
