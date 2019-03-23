//// CHANGE name=change0
CREATE TABLE table199 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype3field usertype3,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table199
    ADD CONSTRAINT table199_pkey PRIMARY KEY (id);



GO
