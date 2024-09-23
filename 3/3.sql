select distinct C.Email, C.FirstName + ' ' + C.LastName as CustomerName, C.PostalCode, C.Address, C.Country
from Customer C
         left join dbo.Employee E on E.EmployeeId = C.SupportRepId
         join dbo.Invoice I on C.CustomerId = I.CustomerId and year(InvoiceDate) = 2012
where C.Email not like '%@%.%'