//// CHANGE name=change0
create table Account (
    id integer not null,
    accountBalance double,
    accountHolder_id integer,
    accountType_id integer,
    primary key (id)
)
GO

//// CHANGE FK name=Account_Person
alter table Account 
       add constraint Account_Person
       foreign key (accountHolder_id) 
       references Person
GO

//// CHANGE FK name=Account_AccountType
alter table Account 
       add constraint Account_AccountType
       foreign key (accountType_id) 
       references AccountType
GO

//// CHANGE name="accountOpenDate"
alter table Account add column accountOpenDate date
GO

//// CHANGE name="rollbackImmediate"
alter table Account add column rollbackImmediate integer
GO
