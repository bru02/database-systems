select year(InvoiceDate) as Year,
       Quantity * IL.UnitPrice as 'Net Value',
       T.Name as 'Track Name',
       G.Name as 'Genre'
from Invoice
join dbo.InvoiceLine IL on Invoice.InvoiceId = IL.InvoiceId
join dbo.Track T on IL.TrackId = T.TrackId
left join dbo.Genre G on T.GenreId = G.GenreId
where Milliseconds >= 60 * 1000
order by Year, G.Name