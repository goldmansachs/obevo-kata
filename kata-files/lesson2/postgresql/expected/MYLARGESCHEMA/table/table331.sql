//// CHANGE name=change0
CREATE TABLE table331 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table331
    ADD CONSTRAINT table331_pkey PRIMARY KEY (id);



GO
