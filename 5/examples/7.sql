select year(InvoiceDate),
                sum(Total),
                format(sum(Total) / sum(sum(Total)) over (), 'p0')
from Invoice
group by year(InvoiceDate)