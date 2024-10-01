select Title, Track.Name, A2.Name, Quantity, Milliseconds / 60000 as Length
from (select Track.TrackId, count(PT.PlaylistId) as Quantity
      from Track
               left join dbo.PlaylistTrack PT on Track.TrackId = PT.TrackId
      group by Track.TrackId) T
         join Track on T.TrackId = Track.TrackId
         join dbo.Album A on Track.AlbumId = A.AlbumId
         join dbo.Artist A2 on A.ArtistId = A2.ArtistId
where Quantity < 3 and (Title like '%rock%' or A2.Name like '%rock%' or Track.Name like '%rock%')
order by Title, Quantity desc