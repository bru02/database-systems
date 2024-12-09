-- Formulate 10 queries based on your own ideas, which answer movie-related questions based on the
-- database.
-- For example:
-- • What is the average rating (Imdb_votes) of movies of different streaming providers?

select Streamingprovidername, avg(ImdbScore) as AverageRating
from Movie
join StreamingProviderMovies on Movie.ImdbId = StreamingProviderMovies.ImdbID
join Dbo.Streamingprovider S on Streamingprovidermovies.Streamingproviderid = S.Streamingproviderid
group by Streamingprovidername;

-- • Which streaming provider offers the largest number of movies?
select Streamingprovidername, count(*) as NumberOfMovies
from Movie
join StreamingProviderMovies on Movie.ImdbId = StreamingProviderMovies.ImdbID
join Dbo.Streamingprovider S on Streamingprovidermovies.Streamingproviderid = S.Streamingproviderid
group by Streamingprovidername
-- • Which actor plays the most characters?
select Name, count(*) as NumberOfCharacters
from Person
join MovieActor on Person.PersonId = MovieActor.PersonId
group by Name
order by NumberOfCharacters desc
-- Save the queries as a View.
