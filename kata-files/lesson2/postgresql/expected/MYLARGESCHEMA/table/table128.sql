//// CHANGE name=change0
CREATE TABLE table128 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table128
    ADD CONSTRAINT table128_pkey PRIMARY KEY (id);



GO
