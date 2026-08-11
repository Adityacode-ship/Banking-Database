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
 alter table banking 
 add DateofBirth date;
 
 desc banking;
 alter table banking
 modify phone varchar(20);
 
 alter table accounts
 add constraint chk_minbalance
 check (balance>=1000);

 desc accounts;
 
 drop table accountbranches;
 alter table accounts 
 add customerID int;
 
 alter table accounts
 add constraint fk_accounts_customers
 foreign key (customerID) 
 references banking(customerID);
 
 desc accounts;
 
 alter table accounts
 add constraint 
 primary key (account_id);
 
 alter table banking
 modify FirstName varchar(50) not null;
 
 desc banking;
 
 alter table banking
 add constraint
 unique(email);
 
 desc banking;
 alter table branch
 add constraint
 primary key(branchID);
 
 DESC BRANCH;
 
 alter table accounts
 add constraint 
 foreign key (branchID)
 references branch(branchID);
 
 alter table accounts
 add branchID int;
 
 desc accounts;
 
 alter table transaction
 add account_id int;
 
alter table transaction
add constraint 
foreign key (account_id)
references accounts(account_id);
desc transaction;

alter table loans
add CustomerID int;

alter table loans
add constraint
foreign key (CustomerID)
references banking(CustomerID);
desc loans;
 
select -- to show all constraint name
	constraint_name,
    constraint_type
from information_schema.table_constraints
where table_schema = "bankingdb"
  and table_name = "accounts";
  
show create table accounts;

alter table transaction
add constraint
primary key (account_id);

alter table transaction
add constraint
foreign key(account_id)
references accounts(account_id);

desc transaction;

alter table loans
add constraint PK_loans
primary key(loanID); 


use bankingdb;

insert into banking
(CustomerID, FirstName, LastName, Email, Phone, DateofBirth)
Values
(103,"Rohit","sharma","sharma@gmail.com","7972874038","2004-07-10");

select * from banking;

insert into accounts
(account_id,account_type,Balance,customerID)
values(1255,"current",1000,101);
select * from accounts;

insert into banking
(CustomerID, FirstName, LastName, Email, Phone, DateofBirth)
Values
(104,"Virat","Kohli","kohli@gmail.com","8080569957","1989-10-13"),
(105,"mohit","doshi","mohit@gmail.com","8080569957","1989-10-18");
select * from banking;

update banking set AccountCreationDate = "2022-05-25"
where CustomerID = 104;

insert into branch
values-- (901,"mankapur","mankapur,Nagpur","88995522"),
-- (902,"Shankar nagar","sitabuldi,Nagpur","78563214"),
-- (903,"Vaishali Nagar","Kamalchowk,Nagpur","909697382"),
(904,"Dharampeth","sitabuldi,Nagpur","75566321"),
(905,"wasudev Nagar","wadi,Nagpur","98956522");

update accounts set branchID = 901
where account_id=1255;

insert into accounts
(account_id,account_type,Balance,customerID,branchID)
values-- (1256,"current",1200,102,902),
-- (1257,"saving",1600,103,903),
(1258,"current",10000,104,904),
(1259,"current",1366,105,905);

select * from accounts;

insert into transaction
values-- (601,"2026-07-26","5000","UPI",1255),
-- (602,"2026-07-28","10000","RTGS",1256),
-- (603,"2026-07-31","12000","CASH",1257),
(604,"2026-01-5","8500","UPI",1258),
(605,"2026-03-10","20000","RTGS",1259);

select * from transaction;

insert into loans
values-- (501,"2000","5","2022-06-01","2022-08-03",101),
-- (502,"5000","10","2025-08-23","2025-09-23",102),
-- (503,"6000","7","2026-06-25","2026-07-03",103),
(504,"16000","12","2026-06-02","2026-09-03",104),
(505,"8500","10","2026-05-16","2026-10-17",105);

select * from accounts;

update accounts set balance = 60000
where account_id = 1255;

update accounts set balance = balance + 5000
where account_id = 1256;

select * from banking;

update banking set Email = "gaidhane@gmail.com", phone = "9922508562"
where CustomerID = 101;

SELECT 
    customerid,firstname, lastname, dateofbirth
FROM
    banking;
    
select * from accounts where balance > 2000;
select * from accounts where account_type != "saving" && balance > 2000; -- USE AND SYMBOL &&, FOR OR USE ||

select * from accounts where NOT balance > 2000;

select * from accounts;

update banking set AccountCreationDate = "2025-07-03"
where CustomerID = 101;
update banking set AccountCreationDate = "2026-01-25"
where CustomerID = 102;
update banking set AccountCreationDate = "2022-03-18"
where CustomerID = 105;

select * from banking
where AccountCreationDate >"2023-01-01";

select FirstName, LastName, Email from banking
where Phone = "9922508562" or phone= "7972874038"or phone= "8080569957";


-- between operator
select * from accounts
where Balance between 5000 and 20000; -- range sorting

select * from accounts
where Balance < 20000 && Balance > 5000; -- range sorting

-- like operator
-- find all customers whose first name starts with letter "k"

select * from banking
where FirstName like "A%";

select * from banking
where LastName like "%E";-- ends with "e" "%" matcher any number of char and even 0 characters and "_" matches exactly one charachers

select * from banking
where LastName like "________";

-- order by clause sorting

select CustomerID, Balance
from accounts
order by Balance;

select BranchID, BranchName
from branch
order by BranchName DESC;

select CustomerID, Balance, Account_type
from accounts
order by Account_type desc,Balance desc; 
select distinct Account_type
from Accounts;

select * from transaction;

select distinct transactionType, account_id
from transaction;

select * from accounts
order by balance desc limit 3 ;
select * from accounts
order by balance desc limit 1 offset 2 ;

select * from accounts
order by balance desc limit 2,1 ; -- two represent offset and 1 represent limit
select * from banking;
insert into banking(CustomerID, FirstName, LastName, Email, AccountCreationDate, DateofBirth)
values(106,"raghav","churhe","raghav@gmail.com","2026-03-01","2008-01-05"),
(107,"ram","neware","ram@gmail.com","2021-02-16","1981-06-02"),
(108,"jay","ahir","ahir@gmail.com","2023-03-15","2002-09-16");
select * from banking
where phone is not null;

select * from accounts;

insert into accounts
(account_id,account_type,Balance,customerID,branchID)
values(1260,"saving",20000,106,902),
(1261,"saving",16000,107,905),
(1262,"saving",6000,108,903),
(1263,"current",50000,108,902);

select * from transaction;

insert into loans
values(506,"2000","5","2022-06-02","2022-08-03",106),
(507,"25000","10","2025-08-16","2025-09-23",102),
(508,"16000","7","2026-06-25","2026-07-03",103),
(509,"26000","12","2026-06-02","2026-09-03",105),
(510,"9000","10","2026-05-16","2026-10-17",105);

insert into transaction
values(606,"2026-09-26","5000","UPI",1260),
(607,"2026-07-05","10000","RTGS",1261),
(608,"2026-07-02","12000","CASH",1262),
(609,"2026-05-05","8500","UPI",1263);
-- (610,"2026-03-10","20000","RTGS",1263);

select * from transaction;

 alter table transaction
 add constraint 
 foreign key (account_id) 
 references accounts(account_id);
 
 select * from accounts;
 
 -- ifn my balance value is <50000 else low vale customers
 
 select account_id, account_type, Balance,
 case 
	when Balance>= 20000 then " High Value Customers"
    else "Low Value Customers"
 end as category
 from accounts;
 
 select CustomerID, FirstName, Email from banking -- level 1 Q1
 where AccountCreationdate > "2025-01-15";
 
 select * from accounts 
 where account_type = "saving" AND Balance >"2000";
 
 SELECT * from Banking 
 where phone is not null;
 
select distinct Account_type
from Accounts;

select * from banking
where FirstName like "A%";

select * from accounts 
where account_type = "saving" && balance between "2000" AND "20000";

select FirstName, LastName from banking where phone is null;


select * from banking 
where FirstName like "A%" && LastName like "%e";

select * from accounts
where account_type = "saving" or "current" && balance > "10000";

select * from banking
where CustomerID in (101,102,103,104) && phone is not null ;

select * from banking
where FirstName like "R%" && phone is null;

select * from accounts
where balance not between "10000" AND "20000";

select * from banking
where CustomerID NOT in (101,102,103,104);
select * from transaction;

select * ,
case
	when transactionType = "UPI" then "Not applicable"
    when amount >= "12000" then "high amount"
    when amount >="8000" then "medium amount"
		else "low amount"
	end as eligible
    from transaction;
    
select *,
case 
	when transactionType = "UPI" then "Digital Transaction"
		else "cash method"
        
	end as transactionCategory
    from transaction;
    
    select * from transaction;
    
    select CustomerID, upper (FirstName),upper(LastName) from banking;
  select CustomerID, lower (FirstName),lower(LastName) from banking;
--  select account_id, account_type, Balance,
--  case 
-- 	when Balance>= 20000 then " High Value Customers"
--     else "Low Value Customers"
--  end as category
--  from accounts;
select length("nagpur") as characters;
select length("नागपूर");-- gives output in no. of bytes 
select character_length("नागपूर"); -- gives output in no. of character
select concat(FirstName," ",LastName) as FullName from banking;
select CustomerID,concat(substr(FirstName,1,1),".",substr(LastName,1)) as short_name from banking;