select *
from hw2nij.HappinessAlcoholConsumption;


create table Region
(
    Region     nvarchar(50) not null,
    Hemisphere nvarchar(50) not null check (Hemisphere in ('south', 'north', 'both')),
    Id         int          not null identity primary key
)
insert Region
select distinct Region, Hemisphere
from HappinessAlcoholConsumption

create table Drinktype
(
    Drinktype nvarchar(50) not null,
    Id        int          not null identity primary key
)

create table Country
(
    Id             int          not null identity primary key,
    Country        nvarchar(50) not null,
    HappinessScore decimal(2, 1),
    RegionId       int          not null foreign key references Region (Id)
)
insert Country
select Country, HappinessScore, R2.Id as RegionId
from HappinessAlcoholConsumption
join Region R2 on HappinessAlcoholConsumption.Region = R2.Region

create table CountryConsumptions
(
    Consumption smallint not null,
    Drinktypeid int      not null foreign key references Drinktype (Id),
    Countryid   int      not null foreign key references Country (Id),
    primary key (Drinktypeid, Countryid)
)

create or alter function AlcoholPct(@drinktype nvarchar(50)) returns float as
begin
    return case
               when @drinktype = 'beer' then 0.05
               when @drinktype = 'wine' then 0.12
               when @drinktype = 'spirit' then 0.45
        end
end

insert CountryConsumptions
select 10, X.Id, Country.Id
from (select *
      from HappinessAlcoholConsumption,
           Drinktype) X
join Country on X.Country = Country.Country

select Hemisphere                      as [@hemisphere],
       Region                          as RegionName,
       (select Country as CountryName, HappinessScore
        from Country
        where RegionId = Region.Id
        for xml path('Country'), type) as Countries
from Region
for xml path('Region'), root('Regions')

create or alter proc AlcoholicGANG @country nvarchar(50) as
begin
    declare @DrinkType nvarchar(50), @consumption int, @pure float;
    set @pure = 0;
    declare C cursor for select Drinktype, Consumption
                         from CountryConsumptions
                         join Country C2 on CountryConsumptions.Countryid = C2.Id
                         join Drinktype D on D.Id = CountryConsumptions.Drinktypeid
                         where Country = @country;

    open C;
    print 'ALCOHOL'
    fetch next from C into @DrinkType, @consumption;

    while @@FETCH_STATUS = 0 begin
        print @DrinkType + ' per capita consumptngksdjgnsd os:' + cast(@consumption as varchar(max))
        set @pure = @pure + @consumption * hw2nij.AlcoholPct(@DrinkType)
        fetch next from C into @DrinkType, @consumption;
    end

    print 'PJURE: ' + format(@pure, 'n2')

    close C;
    deallocate C;

end

go;

exec hw2nij.AlcoholicGANG 'Hungary'