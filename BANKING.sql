use bankingdb;
create table banking(
CustomerID INT PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
phone varchar(15),
AccountCreationDate date
);

describe banking;
select * from banking;

