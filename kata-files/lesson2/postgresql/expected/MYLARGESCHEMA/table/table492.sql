//// CHANGE name=change0
CREATE TABLE table492 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype2field usertype2
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table492
    ADD CONSTRAINT table492_pkey PRIMARY KEY (id);



GO
