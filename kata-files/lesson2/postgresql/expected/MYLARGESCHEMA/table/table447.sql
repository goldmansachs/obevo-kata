//// CHANGE name=change0
CREATE TABLE table447 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype8field usertype8,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table447
    ADD CONSTRAINT table447_pkey PRIMARY KEY (id);



GO
