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


create table Accounts (
account_id int primary key,
account_type varchar(50),
Balance decimal(10,2)
);

desc Accounts;

create table transaction(
transactionID int,
transactionDate date,
amount decimal(10,2),
transactionType varchar(20)
);
 desc transaction;
 
 create table branch (
 branchID int,
 branchName varchar(100),
 branchAddress varchar(200),
 branchPhone varchar(15)
 );
 
 desc branch;
 
 create table accountBranches (
 assignment date
 );

create table loans (
loanID int,
loanAmt decimal (10,2),
interest decimal(5,2),
startdate date,
enddate date
);
 
 