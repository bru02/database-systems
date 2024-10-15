select T.Name                                     as TrackName,
       Milliseconds / 60000.0                     as 'Minutes',
       UnitPrice                                  as NetPrice,
       UnitPrice * 1.27                           as GrossPrice,
       MT.Name                                    as MediaType,
       A.Title                                    as AlbumTitle,
       A2.Name                                    as ArtistName,
       round(UnitPrice / Milliseconds * 60000, 2) as PricePerMinute,
       case
           when UnitPrice / Milliseconds * 60000 <= .5 then 'Cheap'
           when UnitPrice / Milliseconds * 60000 >= 5 then 'Expensive'
           else 'Average'
           end                                    as Category
from Track T
         join dbo.MediaType MT on T.MediaTypeId = MT.MediaTypeId
         join dbo.Album A on T.AlbumId = A.AlbumId
         join dbo.Artist A2 on A.ArtistId = A2.ArtistId
where UnitPrice * 1.27 > 2
order by A2.Name, A.Title