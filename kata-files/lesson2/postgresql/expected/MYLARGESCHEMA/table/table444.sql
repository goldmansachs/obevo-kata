//// CHANGE name=change0
CREATE TABLE table444 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table444
    ADD CONSTRAINT table444_pkey PRIMARY KEY (id);



GO
