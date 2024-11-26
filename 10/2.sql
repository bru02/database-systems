create or alter function NetCalc(
    @UnitPrice decimal,
    @Quantity decimal
    ) returns decimal(5, 2) as begin
        return round(@UnitPrice * @Quantity, 2)
end;
go;

create or alter function TaxCalc(
    @Net decimal,
    @VAT int
) returns decimal as begin
    return round(@Net * (@VAT / 100.0), 2)
end;
go;
create or alter function GrossCalc(
    @Net decimal,
    @VAT int
) returns int as begin
    return round(@Net + dbo.TaxCalc(@Net, @Vat), 0)
end
go;

create or alter function RoyaltyFeeCalc(
    @ArtistId int
) returns decimal(3, 2) as begin
    declare @N int;
    select @N = count(*) from Album where ArtistId = @ArtistId;

    return case
        when @N < 10 then 0.1
        when @N < 20 then 0.15
        else .2
    end
end
go;

select dbo.NetCalc(1.89, 10), dbo.TaxCalc(100, 27), dbo.GrossCalc(100, 27);

declare artists cursor for select Name, ArtistId from Artist;
open artists;

declare @Name nvarchar(120);
declare @ArtistId int;

fetch next from artists into @Name, @ArtistId;
while @@FETCH_STATUS = 0 begin
    print concat(@Name, '-s fee is ', dbo.RoyaltyFeeCalc(@ArtistId));
    fetch next from artists into @Name, @ArtistId;
end

close artists;
deallocate artists;
go;

select A.ArtistId, Name, count(*)
from Artist
join Dbo.Album A on Artist.Artistid = A.Artistid
group by A.ArtistId, Name
;