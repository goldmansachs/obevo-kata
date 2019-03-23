//// CHANGE name=change0
CREATE TABLE table239 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table239
    ADD CONSTRAINT table239_pkey PRIMARY KEY (id);



GO
