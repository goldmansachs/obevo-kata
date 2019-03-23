//// CHANGE name=change0
CREATE TABLE table76 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table76
    ADD CONSTRAINT table76_pkey PRIMARY KEY (id);



GO
