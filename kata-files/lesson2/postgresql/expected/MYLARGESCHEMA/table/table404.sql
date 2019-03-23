//// CHANGE name=change0
CREATE TABLE table404 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table404
    ADD CONSTRAINT table404_pkey PRIMARY KEY (id);



GO
