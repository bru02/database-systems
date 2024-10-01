select Name, Title, NumberOfTracks, Length
from (select Album.AlbumId, count(*) As NumberOfTracks, format(sum(Milliseconds) / 60000.0, 'n1') as Length
      from Album
               join dbo.Artist A on A.ArtistId = Album.ArtistId
               join Track on Album.AlbumId = Track.AlbumId and UnitPrice <= 1
      group by Album.AlbumId) Q
join Album on Album.AlbumId = Q.AlbumId
join Artist on Album.ArtistId = Artist.ArtistId
where NumberOfTracks >= 5
