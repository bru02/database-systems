declare @i int;
set @i = 1;

while @i < 12 begin
    select * from dbo.Employee where month(BirthDate) = @i;
    set @i = @i + 1;
end