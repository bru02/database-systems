declare curse cursor for select LastName, BirthDate from dbo.Employee;

declare @lastname nvarchar(20);
declare @birthdate datetime;

open curse;
fetch next from curse into @lastname, @birthdate;

while @@FETCH_STATUS = 0 begin
    print concat(@lastname, ' is ', datediff(year, @birthdate, getdate()))
    fetch next from curse into @lastname, @birthdate;
end

close curse
deallocate curse