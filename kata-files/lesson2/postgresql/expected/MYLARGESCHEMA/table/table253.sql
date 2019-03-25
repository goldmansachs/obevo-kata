//// CHANGE name=change0
CREATE TABLE table253 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table253
    ADD CONSTRAINT table253_pkey PRIMARY KEY (id);



GO
