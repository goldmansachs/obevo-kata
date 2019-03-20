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

//// CHANGE FK name=Person_Country
alter table Person 
       add constraint Person_Country
       foreign key (addressCountry_id) 
       references Country
GO
