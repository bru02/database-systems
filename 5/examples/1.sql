select *,
       upper(left(BillingCountry, 2)) +
       cast(row_number() over (partition by year(InvoiceDate), BillingCountry order by InvoiceDate) as varchar) + '/' + cast(year(InvoiceDate) as varchar)
from Invoice
