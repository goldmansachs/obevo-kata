//// CHANGE name=change0
CREATE TABLE table364 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table364
    ADD CONSTRAINT table364_pkey PRIMARY KEY (id);



GO
