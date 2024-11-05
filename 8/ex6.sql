-- Summarize total value by customerids and cities. Create a ranking based on the income
-- partitioned by the city. Only indicate those customerids where the ranking is lower than 4.
with sums as (select distinct CustomerId, BillingCity, sum(Total) over (partition by CustomerId) as Income
              from dbo.Invoice),
     ranked as
         (select *, rank() over (partition by BillingCity order by Income desc) as ranking from sums)
select *
from ranked
where ranking < 4;