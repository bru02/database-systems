with galbums as (select distinct Track.AlbumId, Track.GenreId
                 from Track
                 group by Track.AlbumId, Track.GenreId
                 having count(distinct Track.GenreId) = 1),
     xy as (select Name                 as GenreName,
                   (cast((select Album.AlbumId as [Album/@Id], Title as [Album]
                            from Album
                            where AlbumId in (select galbums.AlbumId from galbums where galbums.GenreId = Genre.GenreId)
                            for xml path('Album'), TYPE).query('Album/Album') as xml
                              )
                    ) as Albums
            from Genre)
select *
from xy
where Albums.exist('*') = 1
for xml path('Genre'), root('Genres');