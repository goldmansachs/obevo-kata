//// CHANGE name=change0
CREATE TABLE table391 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table391
    ADD CONSTRAINT table391_pkey PRIMARY KEY (id);



GO
