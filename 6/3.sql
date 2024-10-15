select year(InvoiceDate),
       g.Name,
       sum(InvoiceLine.UnitPrice),
       sum(Quantity),
       rank() over (partition by year(InvoiceDate) order by sum(Quantity) desc)
from InvoiceLine
         join dbo.Invoice I on InvoiceLine.InvoiceId = I.InvoiceId
         join dbo.Track T on InvoiceLine.TrackId = T.TrackId
         left join dbo.Genre G on T.GenreId = G.GenreId
         join dbo.PlaylistTrack PT on T.TrackId = PT.TrackId
where T.Composer is not null
  and (T.Milliseconds > (select avg(Milliseconds) from Track where Track.GenreId = G.GenreId))
group by year(InvoiceDate), g.name
