//// CHANGE name=change0
CREATE TABLE table9 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype2field usertype2,
    usertype1field usertype1,
    usertype8field usertype8
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table9
    ADD CONSTRAINT table9_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

GO
