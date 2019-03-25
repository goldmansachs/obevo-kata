//// CHANGE name=change0
CREATE TABLE table290 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table290
    ADD CONSTRAINT table290_pkey PRIMARY KEY (id);



GO
