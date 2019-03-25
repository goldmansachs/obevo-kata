//// CHANGE name=change0
CREATE TABLE table210 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table210
    ADD CONSTRAINT table210_pkey PRIMARY KEY (id);



GO
