declare @data xml;
select @data = '
<movies>

    <movie id="1">

        <title>The Shawshank Redemption</title>

        <genre>Drama</genre>

        <mediatype>DVD</mediatype>

        <length>142 minutes</length>

    </movie>

    <movie id="2">

        <title>Pulp Fiction</title>

        <genre>Crime</genre>

        <mediatype>Online</mediatype>

        <length>154 minutes</length>

    </movie>

    <movie id="3">

        <title>The Godfather</title>

        <genre>Crime</genre>

        <mediatype>DVD</mediatype>

        <length>175 minutes</length>

    </movie>

    <movie id="4">

        <title>Inception</title>
        <genre>Science Fiction</genre>
        <mediatype>Online</mediatype>
        <length>148 minutes</length>
    </movie>
</movies>';

with relational_data as (select Movie.value('@id', 'int')                     as Id,
                                Movie.value('(title)[1]', 'VARCHAR(100)')     as Title,
                                Movie.value('(genre)[1]', 'VARCHAR(100)')     as Genre,
                                Movie.value('(mediatype)[1]', 'VARCHAR(100)') as MediaType,
                                Movie.value('(length)[1]', 'VARCHAR(100)')    as Length
                         from @data.nodes('movies/movie') as T(Movie))
select Title, Genre, GenreId, MediaType, max(Id) over () + row_number() over (order by Id) as ProposedId,

       cast(left(length, charindex(' ', length)) as int) * 60000 as Length
from relational_data
left join Genre on Genre = Name;