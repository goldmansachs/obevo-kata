//// CHANGE name=change0
CREATE TABLE table205 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table205
    ADD CONSTRAINT table205_pkey PRIMARY KEY (id);



GO
