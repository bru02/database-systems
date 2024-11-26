create or alter proc CustGang(@Id int) as
begin
    declare @InvoiceDate date;

    select top 1 @InvoiceDate = InvoiceDate
    from dbo.Invoice
    where CustomerId = @Id;

    declare @Genre nvarchar(120);

    select top 1 @Genre = Genre.Name
    from dbo.Genre
    join dbo.Track T on Genre.GenreId = T.GenreId
    join InvoiceLine IL on T.TrackId = IL.TrackId
    join dbo.Invoice I on IL.InvoiceId = I.InvoiceId
    where I.CustomerId = @Id
    group by Genre.Name
    order by count(T.TrackId) desc;

    declare @Total decimal;

    select @Total = sum(Total) from Invoice where CustomerId = @Id;

    print concat(
            format(@InvoiceDate, 'yyyy. MM. dd.'),
            ' ',
            @Genre,
            ' ',
            @Total
          );
end;
go;

declare curs cursor for select CustomerId, concat(FirstName, ' ', LastName)
                        from dbo.Customer;
declare @Id int;
declare @Name varchar(61);

open curs;

fetch next from curs into @Id, @Name;
while @@FETCH_STATUS = 0 begin
    print @Name;
    exec dbo.CustGang @Id = @Id;
    fetch next from curs into @Id, @Name;
end

close curs;
deallocate curs;