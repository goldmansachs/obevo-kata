//// CHANGE name=change0
CREATE TABLE table421 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table421
    ADD CONSTRAINT table421_pkey PRIMARY KEY (id);



GO
