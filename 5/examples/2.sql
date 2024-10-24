select G.Name,
       sum(InvoiceLine.UnitPrice * Quantity) as total,
       rank() over (order by sum(InvoiceLine.UnitPrice * Quantity) desc)
from InvoiceLine
         join Track T on T.TrackId = InvoiceLine.TrackId
         left join Genre G on G.GenreId = T.GenreId
group by G.Name