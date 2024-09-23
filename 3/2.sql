select T.Name, A.Title, Milliseconds / 60000, isnull(G.Name, 'Unknown') from Track T
left join dbo.Album A on A.AlbumId = T.AlbumId
join dbo.PlaylistTrack PT on T.TrackId = PT.TrackId
join dbo.Playlist P on PT.PlaylistId = P.PlaylistId
join dbo.InvoiceLine IL on T.TrackId = IL.TrackId
left join dbo.Genre G on T.GenreId = G.GenreId
where Milliseconds < 60000
order by T.Name, A.Title, Milliseconds desc