drop table #Person;
create table #Person
(
    Firstname  nvarchar(20),
    Lastname   nvarchar(20),
    Email      nvarchar(60),
    PostalCode nvarchar(10),
    City       nvarchar(40),
    Country    nvarchar(40),
    State      nvarchar(40),
    Address    nvarchar(70),
    Company    nvarchar(80),
    Persontype varchar(10)
);

insert into #Person
select Firstname,
       Lastname,
       Email,
       PostalCode,
       City,
       Country,
       State,
       Address,
       'Chinook' ,
       'Employee'
from Employee;

insert into #Person
select FirstName,
       LastName,
       Email,
       PostalCode,
       City,
       Country,
       State,
       Address,
       Company,
       iif(
               exists((select 1 from Invoice where Invoice.CustomerId = Customer.CustomerId)), 'Customer', 'Contact')
from Customer;

select * from #Person;