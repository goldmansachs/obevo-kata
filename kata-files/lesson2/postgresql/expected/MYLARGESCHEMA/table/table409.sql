//// CHANGE name=change0
CREATE TABLE table409 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table409
    ADD CONSTRAINT table409_pkey PRIMARY KEY (id);



GO
