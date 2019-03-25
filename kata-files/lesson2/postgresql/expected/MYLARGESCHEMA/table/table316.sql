//// CHANGE name=change0
CREATE TABLE table316 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table316
    ADD CONSTRAINT table316_pkey PRIMARY KEY (id);



GO
