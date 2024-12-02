-- StreamingProviderMovies: junction table between Movie and StreamingProvider table. PK: ImdbID and
-- StreamingProviderId together.
-- • MovieGenre: junction table between Movie and Genre table. PK: ImdbId and GenreID together.
-- • MovieCountry: junction table between Movie and Country table. PK: ImdbID and CountryId together.

alter table StreamingProviderMovies add constraint pk_spm primary key(imdbid, streamingproviderid);
alter table MovieCountry add constraint pk_c primary key(imdbid, CountryId);

Alter table StreamingProviderMovies Add Constraint FK_StreamingProviderMovies_movie Foreign key(ImdbId) references Movie(Imdbid);
Alter table StreamingProviderMovies Add Constraint FK_StreamingProviderMovies_Genre Foreign key(StreamingProviderId) references StreamingProvider(StreamingProviderId);
Alter table StreamingProviderMovies Add Constraint PK_StreamingProviderMovies_Genre Primary key(ImdbId, StreamingProviderId);