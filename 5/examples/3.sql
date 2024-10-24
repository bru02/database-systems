select CustomerId, datediff(day, min(InvoiceDate), max(InvoiceDate)), rank() over (order by datediff(day, min(InvoiceDate), max(InvoiceDate)))
from Invoice
group by CustomerId;