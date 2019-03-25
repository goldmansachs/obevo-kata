//// CHANGE name=change0
CREATE TABLE table43 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table43
    ADD CONSTRAINT table43_pkey PRIMARY KEY (id);



GO
