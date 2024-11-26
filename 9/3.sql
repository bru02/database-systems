drop table if exists #TheRizzler;

select Invoice.*,
       isnull(Company, 'Private')                                as Company,
       datepart(quarter, InvoiceDate)                            as quarter,
       datepart(year, InvoiceDate)                               as year,
       datepart(month, InvoiceDate)                              as month,
       datepart(day, InvoiceDate)                                as day,
       sum(Total) over (partition by C.CustomerId)               as AllFromCustomer,
       sum(Total) over (partition by isnull(Company, 'Private')) as AllFromCompany
into #TheRizzler
from dbo.Invoice
join dbo.Customer C on C.CustomerId = Invoice.CustomerId;

alter table #TheRizzler add Id int primary key identity;

select *
from #TheRizzler;