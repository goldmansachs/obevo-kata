//// CHANGE name=change0
CREATE TABLE table317 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table317
    ADD CONSTRAINT table317_pkey PRIMARY KEY (id);



GO
