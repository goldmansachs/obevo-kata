//// CHANGE name=change0
create table AccountType (
    id integer not null,
    type varchar(255),
    description varchar(255),
    myMistakenColumn varchar(255),
    primary key (id)
)
GO

//// CHANGE name="drop mistake"
alter table AccountType drop column myMistakenColumn
GO
