//// CHANGE name=change0
CREATE TABLE table326 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table326
    ADD CONSTRAINT table326_pkey PRIMARY KEY (id);



GO
