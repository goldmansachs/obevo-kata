//// CHANGE name=change0
CREATE TABLE table159 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table159
    ADD CONSTRAINT table159_pkey PRIMARY KEY (id);



GO
