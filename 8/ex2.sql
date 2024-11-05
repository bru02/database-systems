select InvoiceId, (select Name from Genre where Genre.GenreId = (select GenreId from Track where TrackId = InvoiceLine.TrackId))
from InvoiceLine
group by InvoiceId, TrackId
having count(InvoiceLineId) = 1