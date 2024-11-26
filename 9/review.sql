-- Create the following table: #Movies
drop table if exists #Movies;
-- • Columns: MovieID (int), Title (varchar(300)), Year (int, nullable), Genre Name (varchar(100),
-- not nullable), Director (varchar(300))
-- Primary key: MovieId
-- • The BoxOffice should be equal to or
-- greater than 0
-- • The title and the year column
-- together should be unique
-- • The default value for the director

create table #Genre (
    GenreId int primary key identity,
    Name varchar(100)
);

-- column should be "not known"
create table #Movies (
    MovieId int primary key,
    Title nvarchar(300),
    Year int,
    GenreId int foreign key references #Genre(GenreId),
    Director varchar(300) default 'not known',
    constraint A unique (Title, Year)
);
-- • Modify the datatype of the Title column to store Unicode titles
-- alter table #Movies alter column Title nvarchar(300);
-- • Modify the genre name column to store null values also
-- • Add a column to store the movie length in milliseconds
alter table #Movies add Length int;
-- • Add a column to store the BOX OFFICE in ten million dollars. Which is the correct datatype to prevent data
-- loss?
alter table #Movies add BoxOffice decimal check(BoxOffice>=0) default 0;
-- • Drop the Genre name column.
-- • Add a GenreID (int) column which can store null values

-- • Update all Director names to "Not known"
update #Movies set Director = 'Not known'
-- • Based on internet search results, fill in the Director column values with appropriate values

-- • Update the GenreId column values based on the #Genre table with appropriate values
delete from #Movies where Director is not null;