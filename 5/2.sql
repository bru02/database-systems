select FirstName + ' ' + LastName + ', ' + Address,
       year(getdate()) - year(BirthDate),
       count(*) over ( partition by month(BirthDate)) - 1,
       case
           when Email not like '%@chinook%' then 'external'
           when datediff(month, HireDate, getdate()) <= 6 then 'probationary'
           else 'employee' end as Cat,
    dense_rank() over (partition by case
           when Email not like '%@chinook%' then 'external'
           when datediff(month, HireDate, getdate()) <= 6 then 'probationary'
           else 'employee' end order by year(BirthDate))
from Employee;