//// CHANGE name=change0
CREATE TABLE table414 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table414
    ADD CONSTRAINT table414_pkey PRIMARY KEY (id);



GO
