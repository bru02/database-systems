select dense_rank() over (order by value) as CountryId, ProductionCountries, value as GenreName
into #countries
FROM Movie
CROSS APPLY OPENJSON(ProductionCountries);

select distinct ImdbId, g.CountryId
into MovieCountry
from #countries g
join Movie m on g.ProductionCountries = m.ProductionCountries

select distinct CountryId, GenreName
into Country
from #countries;

Alter table Country
    alter column CountryId bigint not null
Alter table MovieCountry
    alter column CountryId bigint not null
Alter table Country
    add constraint fesfsdfsd Primary Key (CountryId);

Alter table MovieCountry
    Add Constraint FK_MovieCountry_movie Foreign key (ImdbId) references Movie (ImdbId);
Alter table MovieCountry
    Add Constraint FK_MovieCountry_Genre Foreign key (CountryId) references Country (CountryId);
Alter table MovieCountry
    Add Constraint PK_MovieCountry_Genre Primary key (ImdbId, CountryId);


