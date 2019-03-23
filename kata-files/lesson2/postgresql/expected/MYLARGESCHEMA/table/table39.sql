//// CHANGE name=change0
CREATE TABLE table39 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table39
    ADD CONSTRAINT table39_pkey PRIMARY KEY (id);



GO
