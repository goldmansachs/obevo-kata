//// CHANGE name=change0
CREATE TABLE table407 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table407
    ADD CONSTRAINT table407_pkey PRIMARY KEY (id);



GO
