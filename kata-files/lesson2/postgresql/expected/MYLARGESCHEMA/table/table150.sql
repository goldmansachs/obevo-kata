//// CHANGE name=change0
CREATE TABLE table150 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table150
    ADD CONSTRAINT table150_pkey PRIMARY KEY (id);



GO
