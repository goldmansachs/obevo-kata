//// CHANGE name=change0
CREATE TABLE table116 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table116
    ADD CONSTRAINT table116_pkey PRIMARY KEY (id);



GO
