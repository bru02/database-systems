select InvoiceDate,
       I.InvoiceId,
       format(sum(Milliseconds / 60000.0), 'n2')          as TotalLength,
       concat(format(sum(Bytes / 1048576.0), 'n2'), 'Mb') as TotalSize
from Invoice I
         left join dbo.InvoiceLine IL on I.InvoiceId = IL.InvoiceId
         join dbo.Track T on IL.TrackId = T.TrackId
where datepart(quarter, InvoiceDate) = 4
group by InvoiceDate, I.InvoiceId
having count(IL.TrackId) > 1
order by InvoiceDate, TotalLength