select isnull(Customer.PostalCode, 'No data'), Customer.City, sum(IL.UnitPrice * IL.Quantity) as NetValue, count(TrackId)
from Customer
         left join dbo.Invoice I on Customer.CustomerId = I.CustomerId
         join dbo.InvoiceLine IL on I.InvoiceId = IL.InvoiceId
where Company is null
  and year(InvoiceDate) = 2012
group by City, PostalCode
having count(TrackId) > 1