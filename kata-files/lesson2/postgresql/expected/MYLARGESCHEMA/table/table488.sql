//// CHANGE name=change0
CREATE TABLE table488 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table488
    ADD CONSTRAINT table488_pkey PRIMARY KEY (id);



GO
