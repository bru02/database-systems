select *, format((isnull(canada / lag(canada) over (order by year, month), 1) * 100) - 100, 'P0')
from (select GenreId, year(InvoiceDate) as year, month(InvoiceDate) as month, sum(InvoiceLine.UnitPrice * Quantity) as canada
      from InvoiceLine
               join dbo.Track T on T.TrackId = InvoiceLine.TrackId
               join dbo.Invoice I on I.InvoiceId = InvoiceLine.InvoiceId
      group by GenreId, year(InvoiceDate), month(InvoiceDate)) X