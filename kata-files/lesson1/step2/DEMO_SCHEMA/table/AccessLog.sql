//// CHANGE name=change0
create table AccessLog (
    id integer not null,
    accessTime timestamp,
    accessReason varchar(255),
    accessCount integer,
    primary key (id)
)
GO
