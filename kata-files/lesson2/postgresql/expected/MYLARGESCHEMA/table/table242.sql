//// CHANGE name=change0
CREATE TABLE table242 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table242
    ADD CONSTRAINT table242_pkey PRIMARY KEY (id);



GO
