//// CHANGE name=change0
CREATE TABLE table481 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table481
    ADD CONSTRAINT table481_pkey PRIMARY KEY (id);



GO
