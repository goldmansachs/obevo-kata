//// CHANGE name=change0
CREATE TABLE table182 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype4field usertype4,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table182
    ADD CONSTRAINT table182_pkey PRIMARY KEY (id);



GO
