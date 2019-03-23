//// CHANGE name=change0
CREATE TABLE table77 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table77
    ADD CONSTRAINT table77_pkey PRIMARY KEY (id);



GO
