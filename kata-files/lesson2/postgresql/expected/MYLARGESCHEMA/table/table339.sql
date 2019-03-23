//// CHANGE name=change0
CREATE TABLE table339 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table339
    ADD CONSTRAINT table339_pkey PRIMARY KEY (id);



GO
