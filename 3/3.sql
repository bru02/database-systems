select C.FirstName + ' ' + C.LastName as CustomerName,
       C.PostalCode,
       C.Address,
       C.City,
       C.State,
       C.Country,
       C.Email,
       ContactPerson
from (select distinct C.CustomerId,
                      C.*,


                      isnull(E.FirstName + ' ' + E.LastName, '<No contact person>') as ContactPerson
      from Customer C
               left join dbo.Employee E on E.EmployeeId = C.SupportRepId
               join dbo.Invoice I on C.CustomerId = I.CustomerId and year(InvoiceDate) = 2012
      where C.Email not like '%@%.%') C