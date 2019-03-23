//// CHANGE name=change0
CREATE TABLE table32 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table32
    ADD CONSTRAINT table32_pkey PRIMARY KEY (id);



GO
