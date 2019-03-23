//// CHANGE name=change0
CREATE TABLE table96 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table96
    ADD CONSTRAINT table96_pkey PRIMARY KEY (id);



GO
