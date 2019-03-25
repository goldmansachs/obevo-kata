//// CHANGE name=change0
CREATE TABLE table351 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype8field usertype8,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table351
    ADD CONSTRAINT table351_pkey PRIMARY KEY (id);



GO
