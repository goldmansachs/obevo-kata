//// CHANGE name=change0
CREATE TABLE table238 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table238
    ADD CONSTRAINT table238_pkey PRIMARY KEY (id);



GO
