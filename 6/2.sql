select iif(grouping(a2.Name) = 1, 'All artists',
           A2.Name),
       iif(grouping(g.Name) = 0, isnull(G.Name, 'Unknown'),
           iif(grouping(a2.Name) = 1, 'All genres from all artists', 'All from ' + a2.Name))
        ,
       count(*),
       round(sum(Milliseconds / 60000.0), 2)
from Track
         left join dbo.Genre G on Track.GenreId = G.GenreId
         join dbo.Album A on Track.AlbumId = A.AlbumId
         join dbo.Artist A2 on A.ArtistId = A2.ArtistId
         join dbo.InvoiceLine IL on Track.TrackId = IL.TrackId
group by rollup (A2.Name, G.Name)