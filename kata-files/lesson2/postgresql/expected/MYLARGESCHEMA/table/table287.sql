//// CHANGE name=change0
CREATE TABLE table287 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype4field usertype4,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table287
    ADD CONSTRAINT table287_pkey PRIMARY KEY (id);



GO
