//// CHANGE name=change0
CREATE TABLE table224 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table224
    ADD CONSTRAINT table224_pkey PRIMARY KEY (id);



GO
