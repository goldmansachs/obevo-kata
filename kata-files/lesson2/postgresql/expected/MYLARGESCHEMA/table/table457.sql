//// CHANGE name=change0
CREATE TABLE table457 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table457
    ADD CONSTRAINT table457_pkey PRIMARY KEY (id);



GO
