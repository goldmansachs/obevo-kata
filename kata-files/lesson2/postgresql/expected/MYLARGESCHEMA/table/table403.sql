//// CHANGE name=change0
CREATE TABLE table403 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table403
    ADD CONSTRAINT table403_pkey PRIMARY KEY (id);



GO
