//// CHANGE name=change0
CREATE TABLE table214 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype6field usertype6,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table214
    ADD CONSTRAINT table214_pkey PRIMARY KEY (id);



GO
