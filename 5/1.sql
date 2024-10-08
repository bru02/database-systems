select invoiceid, invoicedate, billingcity + isnull('(' + billingstate + ')', '') + ' / ' + billingcountry, round(total, 0),
       case
           when Total < 1 then 'Low-Value'
           when Total > 10 then 'High-Value'
           else 'Normal'
        end as Category,
        Total - avg(Total) over (partition by BillingCountry, year(InvoiceDate)) as Dev
       from Invoice I
where datepart(quarter, InvoiceDate) > 2 and exists(select 1 from Invoice where InvoiceId <> I.InvoiceId and BillingCountry = I.BillingCountry)
order by Dev desc