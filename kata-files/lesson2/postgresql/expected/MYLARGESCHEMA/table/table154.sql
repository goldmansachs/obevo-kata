//// CHANGE name=change0
CREATE TABLE table154 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype2field usertype2,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table154
    ADD CONSTRAINT table154_pkey PRIMARY KEY (id);



GO
