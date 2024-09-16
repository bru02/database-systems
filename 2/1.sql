select A.Name                                     as 'Artists Name',
       Title                                      as 'Album Title',
       isnull(G.Name, 'unknown')                  as 'Genre Name',
       iif(Composer = A.Name, Composer, '<same>') as Composer
from Album album
         join dbo.Artist A on album.ArtistId = A.ArtistId
         left join dbo.Track T on T.TrackId = (select top 1 TrackId
                                               from Track T2
                                               where T2.AlbumId = album.AlbumId
                                               order by T2.GenreId desc)
         left join dbo.Genre G on T.GenreId = G.GenreId
order by A.Name, Title