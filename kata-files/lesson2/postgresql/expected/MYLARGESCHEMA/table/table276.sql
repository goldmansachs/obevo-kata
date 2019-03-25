//// CHANGE name=change0
CREATE TABLE table276 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table276
    ADD CONSTRAINT table276_pkey PRIMARY KEY (id);



GO
