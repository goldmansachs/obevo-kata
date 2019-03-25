//// CHANGE name=change0
CREATE TABLE table82 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table82
    ADD CONSTRAINT table82_pkey PRIMARY KEY (id);



GO
