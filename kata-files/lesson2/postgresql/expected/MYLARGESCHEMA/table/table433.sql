//// CHANGE name=change0
CREATE TABLE table433 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype3field usertype3
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table433
    ADD CONSTRAINT table433_pkey PRIMARY KEY (id);



GO
