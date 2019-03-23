//// CHANGE name=change0
CREATE TABLE table12 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype7field usertype7,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table12
    ADD CONSTRAINT table12_pkey PRIMARY KEY (id);



GO
