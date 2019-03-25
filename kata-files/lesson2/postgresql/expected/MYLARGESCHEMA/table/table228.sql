//// CHANGE name=change0
CREATE TABLE table228 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype2field usertype2,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table228
    ADD CONSTRAINT table228_pkey PRIMARY KEY (id);



GO
