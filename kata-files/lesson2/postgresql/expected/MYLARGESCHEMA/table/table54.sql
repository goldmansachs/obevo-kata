//// CHANGE name=change0
CREATE TABLE table54 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table54
    ADD CONSTRAINT table54_pkey PRIMARY KEY (id);



GO
