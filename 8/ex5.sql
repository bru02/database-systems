-- Count employees and customers by cities. The resultset should contain two columns.

with AllCities as (select City
                   from dbo.Employee
                   union
                   select City
                   from dbo.Customer)
select City,
       (select count(*) from dbo.Employee where City = AllCities.City) as empl,
       (select count(*) from dbo.Customer where City = AllCities.City) as cust

from AllCities;