//// CHANGE name=change0
CREATE TABLE table139 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table139
    ADD CONSTRAINT table139_pkey PRIMARY KEY (id);



GO
