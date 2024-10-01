select iif(grouping(E.City) = 1, 'Total', isnull(E.City, 'No city')),
       iif(grouping(FullName) = 1, 'Total', isnull(FullName, 'No representative')),
       count(CustomerId)
from (select EmployeeId, City, trim(concat(FirstName, ' ', LastName)) as FullName from Employee) E
         right join Customer on Customer.SupportRepId = EmployeeId
group by rollup (E.City, FullName)