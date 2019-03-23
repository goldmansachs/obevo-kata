//// CHANGE name=change0
CREATE TABLE table196 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table196
    ADD CONSTRAINT table196_pkey PRIMARY KEY (id);



GO
