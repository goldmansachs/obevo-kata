//// CHANGE name=change0
CREATE TABLE table350 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype1field usertype1
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table350
    ADD CONSTRAINT table350_pkey PRIMARY KEY (id);



GO
