select CustomerId, C.LastName, E.FirstName + ' ' + E.LastName
from Customer C
         left join dbo.Employee E on C.SupportRepId = E.EmployeeId
where 2010 <= (select top 1 year(InvoiceDate)
               from Invoice
               where Invoice.CustomerId = C.CustomerId
               order by InvoiceDate)
    and (C.State in (select State
                     from Customer
                     where CustomerId <> C.CustomerId)
    or C.State in (select State
                   from Employee))