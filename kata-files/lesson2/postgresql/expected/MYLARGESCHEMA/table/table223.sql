//// CHANGE name=change0
CREATE TABLE table223 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table223
    ADD CONSTRAINT table223_pkey PRIMARY KEY (id);



GO
