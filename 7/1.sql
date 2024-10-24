select TrackId as [@Id],
       Track.Name as Title,
       Track.Milliseconds as Length,
       Bytes as Size,
       G.Name as Genre,
       MT.Name as Mediatype,
       A.AlbumId as [Album/@Id],
       A.Title as [Album/Title],
  A2.Name as [Album/Artist]

from Track

join dbo.Genre G on Track.GenreId = G.GenreId
join dbo.MediaType MT on Track.MediaTypeId = MT.MediaTypeId
join dbo.Album A on A.AlbumId = Track.AlbumId
join dbo.Artist A2 on A.ArtistId = A2.ArtistId
--where TrackId < 5
for json auto, Root ('Tracks')