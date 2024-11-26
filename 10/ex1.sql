if exists(select 1 from dbo.Employee where month(BirthDate) = month(getdate()))
select FirstName, LastName, datediff(year, BirthDate, getdate()) from dbo.Employee where month(BirthDate) = month(getdate())
else select concat('No birthdays in ', format(getdate(), 'MMMM'))