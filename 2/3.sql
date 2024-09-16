select Quantity,
       IL.UnitPrice,
       Quantity * IL.UnitPrice        as 'Net Amount',
       Quantity * IL.UnitPrice * 1.27 as 'Gross Amount',
       T.Name                         as 'Track Title',
       Title                          as 'Album Title',
       isnull(G.Name, '<unknown>')    as 'Genre name'
from Invoice
         join dbo.InvoiceLine IL on Invoice.InvoiceId = IL.InvoiceId
         join dbo.Track T on IL.TrackId = T.TrackId
         join dbo.Album A on T.AlbumId = A.AlbumId
         join dbo.Artist A2 on A2.ArtistId = A.ArtistId
         left join dbo.Genre G on T.GenreId = G.GenreId
where T.UnitPrice != IL.UnitPrice
order by a2.Name, a.Title