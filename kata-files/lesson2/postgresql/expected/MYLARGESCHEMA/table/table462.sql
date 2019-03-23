//// CHANGE name=change0
CREATE TABLE table462 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table462
    ADD CONSTRAINT table462_pkey PRIMARY KEY (id);



GO
