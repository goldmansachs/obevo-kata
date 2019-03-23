//// CHANGE name=change0
CREATE TABLE table413 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table413
    ADD CONSTRAINT table413_pkey PRIMARY KEY (id);



GO
