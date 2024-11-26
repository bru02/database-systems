select top 1 *
from importmovies2;

select max(len(casT(production_countries as nvarchar(max)))),
       (select count(*) from importmovies2 where production_countries is null) as nulls,
       (select count(*)
        from importmovies2
        where cast(production_countries as varchar) <> cast(production_countries as nvarchar))
from importmovies2;

alter table importmovies2
    alter column production_countries varchar(54) not null;


select distinct streamingprovider as StreamingProviderName
into Streamingprovider
from importmovies2
Alter table Streamingprovider
    add StreamingProviderId int identity primary key;

select StreamingProviderId, imdb_id as ImdbID
into StreamingProviderMovies
from importmovies2
join Streamingprovider on importmovies2.streamingprovider = Streamingprovider.StreamingProviderName;

-- Continue the process with the runtime (max), release_year(min), title (min), description (min), genres (min),
-- production_countries(min).
With M as (select imdb_id as ImdbId,
                  id as Id,
                  min(title)                as Title,
                  min(description)          as Description,
                  min(release_year)         as ReleaseYear,
                  age_certification,
                  max(runtime)              as Runtime,
                  min(genres)               as Genres,
                  min(production_countries) as ProductionCountries,
                  avg(imdb_score)           as ImdbScore,
                  avg(imdb_votes)           as ImdbVotes,
                  avg(tmdb_popularity)      as TmdbPopularity,
                  avg(tmdb_score)           as TmdbScore
           from importmovies2
           group by imdb_id, id, age_certification)
select *
into Movie
from M;

select dense_rank() over (order by value) as GenreId, Genres,  value as GenreName
into #genres
                                         FROM Movie CROSS APPLY OPENJSON(genres);

select distinct ImdbId, g.genreid
into MovieGenre
from #genres g join movie m on g.genres=m.genres


Alter table MovieGenres add constraint PK_MGenre Primary Key(Genreid);


Select distinct m.imdbid, m.genres, g.genrename
from movie m join moviegenre mg on m.imdbid=mg.imdbid join #genres g on mg.genreid=g.genreid
order by m.imdbid

