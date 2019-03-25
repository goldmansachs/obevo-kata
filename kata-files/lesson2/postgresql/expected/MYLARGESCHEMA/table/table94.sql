//// CHANGE name=change0
CREATE TABLE table94 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype8field usertype8,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table94
    ADD CONSTRAINT table94_pkey PRIMARY KEY (id);



GO
