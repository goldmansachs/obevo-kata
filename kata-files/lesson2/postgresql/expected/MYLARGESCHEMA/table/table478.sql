//// CHANGE name=change0
CREATE TABLE table478 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype8field usertype8,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table478
    ADD CONSTRAINT table478_pkey PRIMARY KEY (id);



GO
