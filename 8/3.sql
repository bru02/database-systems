/*Make a list of customers! Include all columns from the customer table.
A.) Only those customers should appear in the list who have a support representative who reports directly or indirectly to Nancy Edwards.
B.) In a separate column, indicate the total value of invoices for each customer. Do it with subselect in the Select clause.
C.) Include the full name of the employee, and the direct supervisor's name also
D.) Only include customers who have an invoice which is in the yearly top 3 invoice (ranking based on total desc)
(26 rows)
*/
with NancysKids as (select EmployeeId
                    from dbo.Employee
                    where FirstName = 'Nancy'
                      and LastName = 'Edwards'
                    union all
                    select Employee.EmployeeId
                    from dbo.Employee
                    join NancysKids on ReportsTo = NancysKids.EmployeeId),
     InvoiceChampionships as (select CustomerId,
                                     rank() over (partition by year(InvoiceDate) order by Total desc) as rank
                              from Invoice)
select (select sum(Total) from Invoice where Customer.CustomerId = Invoice.CustomerId) as Total,
       Customer.CustomerId,
       concat(E.FirstName, ' ', E.LastName),
       concat('< ', S.FirstName, ' ', S.LastName)
from Customer
join dbo.Employee E on E.EmployeeId = Customer.SupportRepId
join dbo.Employee S on E.ReportsTo = S.EmployeeId
where SupportRepId IN (select EmployeeId from NancysKids)
 and Customer.CustomerId in (select CustomerId from InvoiceChampionships where rank <= 3);
