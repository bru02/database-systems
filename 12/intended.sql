Create table #Crew (CrewId int not null identity primary key, ImdbId varchar(10), PersonId
int not null, Rolename varchar(100) not null, Name varchar(100) not null, Character
varchar(100) null)
Declare CastCursor Cursor for
select * from importcrew2
Declare @imdb varchar(10), @xml xml
open CastCursor
Fetch next from CastCursor into @imdb, @xml
While @@fetch_Status = 0
begin
Insert #Crew (Imdbid,personid, rolename, name, character)
SELECT @imdb,
C.value('@id', 'VARCHAR(50)') AS personid,
C.value('(rolename)[1]', 'VARCHAR(100)') AS rolename,
C.value('(name)[1]', 'VARCHAR(100)') AS Name,
C.value('(character)[1]', 'VARCHAR(100)') AS Character
FROM @xml.nodes('/cast/person') AS T(C);
Fetch next from CastCursor into @imdb, @xml
End
close CastCursor
deallocate CastCursor