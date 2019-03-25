//// CHANGE name=change0
CREATE TABLE table347 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table347
    ADD CONSTRAINT table347_pkey PRIMARY KEY (id);



GO
