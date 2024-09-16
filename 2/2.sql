select C.CustomerId,
       C.LastName,
       C.FirstName,
       C.Country,
       BillingCountry,
       C.PostalCode,
       BillingPostalCode,
       C.Address,
       BillingAddress,
       E.FirstName + ' ' + E.LastName as 'Employee Name',
       E.Email
from Customer C
         join dbo.Invoice I on C.CustomerId = I.CustomerId
         left join dbo.Employee E on C.SupportRepId = E.EmployeeId
where (BillingPostalCode is not null and C.PostalCode is not null and C.PostalCode != BillingPostalCode)
   or I.BillingCountry != C.Country
   or BillingAddress != C.Address
