//// CHANGE name=change0
CREATE TABLE table142 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table142
    ADD CONSTRAINT table142_pkey PRIMARY KEY (id);



GO
