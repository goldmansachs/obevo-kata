//// CHANGE name=change0
CREATE TABLE table130 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table130
    ADD CONSTRAINT table130_pkey PRIMARY KEY (id);



GO
