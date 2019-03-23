//// CHANGE name=change0
CREATE TABLE table243 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table243
    ADD CONSTRAINT table243_pkey PRIMARY KEY (id);



GO
