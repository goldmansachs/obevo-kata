//// CHANGE name=change0
CREATE TABLE table380 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table380
    ADD CONSTRAINT table380_pkey PRIMARY KEY (id);



GO
