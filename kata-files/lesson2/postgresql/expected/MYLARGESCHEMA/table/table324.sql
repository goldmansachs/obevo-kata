//// CHANGE name=change0
CREATE TABLE table324 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table324
    ADD CONSTRAINT table324_pkey PRIMARY KEY (id);



GO
