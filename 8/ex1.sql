select Playlist.Name, T.Name
from dbo.Playlist
         join dbo.PlaylistTrack PT on Playlist.PlaylistId = PT.PlaylistId
         join dbo.Track T on PT.TrackId = T.TrackId
where Milliseconds = (select max(Milliseconds) from Track)