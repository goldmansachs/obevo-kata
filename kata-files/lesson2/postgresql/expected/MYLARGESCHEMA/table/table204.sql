//// CHANGE name=change0
CREATE TABLE table204 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table204
    ADD CONSTRAINT table204_pkey PRIMARY KEY (id);



GO
