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

//// CHANGE name=addressCountry_id
alter table Person add column addressCountry_id varchar(255)
GO

//// CHANGE FK name=Person_Country includeDependencies="peopleMigrateCountryName.migrate"
alter table Person
       add constraint Person_Country
       foreign key (addressCountry_id)
       references Country
GO

//// CHANGE name="dropAddressCountryName"
alter table Person drop column addressCountryName
GO
