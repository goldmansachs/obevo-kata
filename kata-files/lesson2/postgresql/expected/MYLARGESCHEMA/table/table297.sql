//// CHANGE name=change0
CREATE TABLE table297 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table297
    ADD CONSTRAINT table297_pkey PRIMARY KEY (id);



GO
