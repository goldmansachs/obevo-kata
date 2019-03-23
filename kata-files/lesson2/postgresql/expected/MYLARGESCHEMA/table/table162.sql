//// CHANGE name=change0
CREATE TABLE table162 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table162
    ADD CONSTRAINT table162_pkey PRIMARY KEY (id);



GO
