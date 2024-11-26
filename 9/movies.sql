declare @movies xml;

set @movies = '
<movies>
    <movie>
        <title>The Shawshank Redemption</title>
        <year>1994</year>
        <director>Frank Darabont</director>
        <genre>Drama</genre>
        <box_office>$58,500,000</box_office>
        <length>142</length>
    </movie>
    <movie>
        <title>The Godfather</title>
        <year>1972</year>
        <director>Francis Ford Coppola</director>
        <genre>Crime</genre>
        <box_office>$246,120,986</box_office>
        <length>175</length>
    </movie>
    <movie>
        <title>The Dark Knight</title>
        <year>2008</year>
        <director>Christopher Nolan</director>
        <genre>Action</genre>
        <box_office>$1,004,934,033</box_office>
        <length>152</length>
    </movie>
    <movie>
        <title>Pulp Fiction</title>
        <year>1994</year>
        <director>Quentin Tarantino</director>
        <genre>Crime</genre>
        <box_office>$213,928,762</box_office>
        <length>154</length>
    </movie>
    <movie>
        <title>Forrest Gump</title>
        <year>1994</year>
        <director>Robert Zemeckis</director>
        <genre>Drama</genre>
        <box_office>$678,226,075</box_office>
        <length>142</length>
    </movie>
    <movie>
        <title>Interstellar</title>
        <year>2014</year>
        <director>Christopher Nolan</director>
        <genre>Sci-Fi</genre>
        <box_office>$677,471,339</box_office>
        <length>169</length>
    </movie>
    <movie>
        <title>Inception</title>
        <year>2010</year>
        <director>Christopher Nolan</director>
        <genre>Sci-Fi</genre>
        <box_office>$829,895,144</box_office>
        <length>148</length>
    </movie>
    <movie>
        <title>Titanic</title>
        <year>1997</year>
        <director>James Cameron</director>
        <genre>Romance</genre>
        <box_office>$2,208,208,395</box_office>
        <length>195</length>
    </movie>
    <movie>
        <title>Avatar</title>
        <year>2009</year>
        <director>James Cameron</director>
        <genre>Sci-Fi</genre>
        <box_office>$2,847,246,203</box_office>
        <length>162</length>
    </movie>
    <movie>
        <title>Gladiator</title>
        <year>2000</year>
        <director>Ridley Scott</director>
        <genre>Action</genre>
        <box_office>$457,640,427</box_office>
        <length>155</length>
    </movie>
    <movie>
        <title>The Silence of the Lambs</title>
        <year>1991</year>
        <director>Jonathan Demme</director>
        <genre>Crime</genre>
        <box_office>$272,742,922</box_office>
        <length>118</length>
    </movie>
    <movie>
        <title>Seven</title>
        <year>1995</year>
        <director>David Fincher</director>
        <genre>Crime</genre>
        <box_office>$327,311,859</box_office>
        <length>127</length>
    </movie>
    <movie>
        <title>The Grand Budapest Hotel</title>
        <year>2014</year>
        <director>Wes Anderson</director>
        <genre>Comedy</genre>
        <box_office>$172,735,961</box_office>
        <length>99</length>
    </movie>
    <movie>
        <title>La La Land</title>
        <year>2016</year>
        <director>Damien Chazelle</director>
        <genre>Musical</genre>
        <box_office>$446,095,997</box_office>
        <length>128</length>
    </movie>
    <movie>
        <title>The Revenant</title>
        <year>2015</year>
        <director>Alejandro G. Inarritu</director>
        <genre>Adventure</genre>
        <box_office>$532,950,503</box_office>
        <length>156</length>
    </movie>
    <movie>
        <title>Blade Runner 2049</title>
        <year>2017</year>
        <director>Denis Villeneuve</director>
        <genre>Sci-Fi</genre>
        <box_office>$259,239,658</box_office>
        <length>164</length>
    </movie>
    <movie>
        <title>The Social Network</title>
        <year>2010</year>
        <director>David Fincher</director>
        <genre>Drama</genre>
        <box_office>$224,920,315</box_office>
        <length>120</length>
    </movie>
    <movie>
        <title>The Shape of Water</title>
        <year>2017</year>
        <director>Guillermo del Toro</director>
        <genre>Adventure</genre>
        <box_office>$195,243,463</box_office>
        <length>123</length>
    </movie>
    <movie>
        <title>Her</title>
        <year>2013</year>
        <director>Spike Jonze</director>
        <genre>Sci-Fi</genre>
        <box_office>$48,419,291</box_office>
        <length>126</length>
    </movie>
    <movie>
        <title>Whiplash</title>
        <year>2014</year>
        <director>Damien Chazelle</director>
        <genre>Drama</genre>
        <box_office>$49,015,827</box_office>
        <length>107</length>
    </movie>
</movies>';

-- • Download the movies.xml from the Moodle. Write a query which extracts the title, year, director, genre,
-- box_office and length varchar columns. Import the data into a new temporary table named #Movies
drop table if exists #Movie;
drop table if exists #Genre;
drop table if exists #Director;

select
    Movie.value('(title)[1]', 'nvarchar(100)') as Title,
    Movie.value('(year)[1]', 'int') as Year,
    Movie.value('(director)[1]', 'nvarchar(100)') as Director,
    Movie.value('(genre)[1]', 'varchar(100)') as Genre,
    Movie.value('(box_office)[1]', 'varchar(100)') as BoxOffice,
    Movie.value('(length)[1]', 'int') as Length
into #Movie
    from @movies.nodes('movies/movie') as T(Movie);


-- • Update the box_office column, remove the $ signs and commas.
update #Movie set BoxOffice = replace(replace(BoxOffice, ',', ''), '$', '');

-- • Alter Year and BoxOffice columns, set appropriate data types.
alter table #Movie alter column BoxOffice bigint;

-- • Add two new nullable int column: Directorid and Genreid.
alter table #Movie add DirectorId int, GenreId int;

-- • Create a new table: #Director. DirectorId (identity), Directorname. Fill up the table with directors without
-- duplicates.
create table #Director (
    DirectorId int primary key identity,
    DirectorName varchar(100)
);


insert #Director (DirectorName)
 select distinct Director from #Movie;

-- • Create a new table: #Genre. Genreid(identity), Genrename. Fill up the table with genres from the Chinook
-- Genre table. Insert the missing genres from the #Movies table.
create table #Genre (
    GenreId int primary key identity,
    GenreName varchar(100)
);

insert #Genre (GenreName) select Name from Genre union select Genre from #Movie;

-- • Update the DirectorId column in #Movies, the ID should come from the #Director table.


-- • Update the GenreId column in #Movies, the ID should come from the #Genre table.


-- • Drop the Genre and the Director columns from #Movies
alter table #Movie drop column Genre, Director;

select * from #Movie;
