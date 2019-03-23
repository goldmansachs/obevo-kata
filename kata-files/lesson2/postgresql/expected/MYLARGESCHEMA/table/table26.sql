//// CHANGE name=change0
CREATE TABLE table26 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table26
    ADD CONSTRAINT table26_pkey PRIMARY KEY (id);



GO
