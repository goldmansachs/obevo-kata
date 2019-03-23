//// CHANGE name=change0
CREATE TABLE table219 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype0field usertype0,
    usertype3field usertype3,
    usertype6field usertype6
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table219
    ADD CONSTRAINT table219_pkey PRIMARY KEY (id);



GO
