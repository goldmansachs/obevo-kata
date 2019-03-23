//// CHANGE name=change0
CREATE TABLE table233 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table233
    ADD CONSTRAINT table233_pkey PRIMARY KEY (id);



GO
