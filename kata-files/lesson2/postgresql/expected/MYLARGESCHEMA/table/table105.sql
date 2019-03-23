//// CHANGE name=change0
CREATE TABLE table105 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table105
    ADD CONSTRAINT table105_pkey PRIMARY KEY (id);



GO
