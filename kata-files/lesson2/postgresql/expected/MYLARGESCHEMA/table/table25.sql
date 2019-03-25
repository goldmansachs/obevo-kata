//// CHANGE name=change0
CREATE TABLE table25 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table25
    ADD CONSTRAINT table25_pkey PRIMARY KEY (id);



GO
