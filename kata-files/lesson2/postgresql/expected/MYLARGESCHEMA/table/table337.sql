//// CHANGE name=change0
CREATE TABLE table337 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table337
    ADD CONSTRAINT table337_pkey PRIMARY KEY (id);



GO
