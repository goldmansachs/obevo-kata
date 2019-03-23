//// CHANGE name=change0
CREATE TABLE table53 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype2field usertype2,
    usertype5field usertype5
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table53
    ADD CONSTRAINT table53_pkey PRIMARY KEY (id);



GO
