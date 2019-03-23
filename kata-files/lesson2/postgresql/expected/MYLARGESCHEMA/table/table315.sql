//// CHANGE name=change0
CREATE TABLE table315 (
    id integer NOT NULL,
    field1 character varying(30),
    usertype7field usertype7,
    usertype5field usertype5,
    usertype9field usertype9
);



GO

//// CHANGE name=change1
ALTER TABLE ONLY table315
    ADD CONSTRAINT table315_pkey PRIMARY KEY (id);



GO
