-- Query invoices, in a separate column indicate the total of the given customer's previous
-- invoice. Filter to those invoices where the value is ten times the previous value (or greater)

select *
from (select *, lag(Total) over (partition by CustomerId order by InvoiceDate desc) as PrevTotal from dbo.Invoice) X
where Total >= 10 * PrevTotal