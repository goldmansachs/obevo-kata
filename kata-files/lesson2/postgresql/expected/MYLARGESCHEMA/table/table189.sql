//// CHANGE name=change0
CREATE TABLE table189 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table189
    ADD CONSTRAINT table189_pkey PRIMARY KEY (id);



GO
