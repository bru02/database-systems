select Name, (select count(*) from dbo.Track where Genre.GenreId = Track.GenreId), (select sum(Milliseconds) from dbo.Track where Genre.GenreId = Track.GenreId) from dbo.Genre