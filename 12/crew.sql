drop table #crew;

select imdb_id                                    as ImdbId,
       N.value('(rolename)[1]', 'nvarchar(max)')  as RoleName,
       N.value('(name)[1]', 'nvarchar(max)')      as Name,
       N.value('(character)[1]', 'nvarchar(max)') as Character,
       N.value('@id', 'int')                      as Id -- case-sensitive gang
into #crew
from importcrew2
cross apply cast.nodes('cast/person') as T(N);

select *
from #crew;

select Character, Id, ImdbId
from #crew
where RoleName = 'actor'
group by Character, Id, ImdbId
having count(*) > 1;

select distinct Id, Name
from #crew
where Id in
      (select Id from #crew group by Id having count(distinct Name) > 1)
order by Id

select Id, max(Name)
from #crew
group by Id
having count(distinct Name) > 1;



-- →Person: to store person data. Columns: PersonId, Name, Id: PersonId
-- →MovieActor: to connect actors and movies. Columns: ImdbId, Personid, Character
-- →MovieDirector: to connect directors and movies. Columns: ImdbId, Personid

create table Person
(
    PersonId int primary key not null,
    Name     nvarchar(100)   not null
);

insert into Person (PersonId, Name)
select Id, Name
from (select row_number() over (partition by c.Id order by m.ReleaseYear desc) as rank, c.*
      from #crew c
      left join Movie m on c.ImdbId = m.ImdbId) X
where rank = 1;

drop table MovieActor;
create table MovieActor
(
    ImdbId    char(10) foreign key references Movie (ImdbId),
    PersonId  int foreign key references Person (PersonId),
    Character nvarchar(163)
)

select #crew.ImdbId, m.* from #crew
left join Movie m on #crew.ImdbId = m.ImdbId
where m.Title is null;

insert into MovieActor (ImdbId, PersonId, Character)
select #crew.ImdbId, #crew.id, coalesce(Character, 'Unknown "', m.Title, '" character') as Character
from #crew
join Movie m on #crew.ImdbId = m.ImdbId
where RoleName = 'actor';


create table MovieDirector
(
    ImdbId   char(10) foreign key references Movie (ImdbId),
    PersonId int foreign key references Person (PersonId)
);
-- • All ImdbId from the #Crew table present in the movie table?

insert into MovieDirector (ImdbId, PersonId)
select #crew.ImdbId, #crew.id
from #crew
join Movie m on #crew.ImdbId = m.ImdbId
where RoleName = 'director';

select count(*) from #crew
where ImdbId not in (select ImdbId from Movie);