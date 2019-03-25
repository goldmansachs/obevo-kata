//// CHANGE name=change0
create table Person (
       id integer not null,
        firstName varchar(255),
        lastName varchar(255),
        addressCountryName varchar(255),
    myMistakenColumn integer,
        primary key (id)
    )
GO

//// CHANGE name="drop mistake"
alter table Person drop column myMistakenColumn
GO

//// CHANGE name=dob
alter table Person add column dob date
GO
