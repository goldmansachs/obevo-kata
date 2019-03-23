//// CHANGE name=change0
CREATE TABLE table193 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table193
    ADD CONSTRAINT table193_pkey PRIMARY KEY (id);



GO
