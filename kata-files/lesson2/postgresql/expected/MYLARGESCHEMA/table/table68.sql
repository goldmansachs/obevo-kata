//// CHANGE name=change0
CREATE TABLE table68 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype1field usertype1,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table68
    ADD CONSTRAINT table68_pkey PRIMARY KEY (id);



GO
