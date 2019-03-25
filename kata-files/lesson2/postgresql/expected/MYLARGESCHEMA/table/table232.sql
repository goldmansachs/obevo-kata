//// CHANGE name=change0
CREATE TABLE table232 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype3field usertype3,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table232
    ADD CONSTRAINT table232_pkey PRIMARY KEY (id);



GO
