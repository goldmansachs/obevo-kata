//// CHANGE name=change0
CREATE TABLE table328 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype7field usertype7
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table328
    ADD CONSTRAINT table328_pkey PRIMARY KEY (id);



GO
