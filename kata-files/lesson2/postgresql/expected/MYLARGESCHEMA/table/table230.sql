//// CHANGE name=change0
CREATE TABLE table230 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table230
    ADD CONSTRAINT table230_pkey PRIMARY KEY (id);



GO
