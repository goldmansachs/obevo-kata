//// CHANGE name=change0
CREATE TABLE table308 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table308
    ADD CONSTRAINT table308_pkey PRIMARY KEY (id);



GO
