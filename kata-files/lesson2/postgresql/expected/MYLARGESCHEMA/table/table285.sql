//// CHANGE name=change0
CREATE TABLE table285 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table285
    ADD CONSTRAINT table285_pkey PRIMARY KEY (id);



GO
