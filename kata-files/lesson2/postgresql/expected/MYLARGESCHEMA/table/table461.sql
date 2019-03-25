//// CHANGE name=change0
CREATE TABLE table461 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table461
    ADD CONSTRAINT table461_pkey PRIMARY KEY (id);



GO
