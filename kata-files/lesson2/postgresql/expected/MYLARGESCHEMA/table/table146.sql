//// CHANGE name=change0
CREATE TABLE table146 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype5field usertype5,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table146
    ADD CONSTRAINT table146_pkey PRIMARY KEY (id);



GO
