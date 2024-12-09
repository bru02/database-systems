select distinct age_certification, '' as Description
into AgeCerts
from Movie
where age_certification is not null;

alter table Movie
    add AgeCertId int foreign key references AgeCerts (AgeCertId);

UPDATE Movie
SET Movie.AgeCertId = Ac.AgeCertId
FROM Movie
JOIN dbo.AgeCerts Ac ON Movie.age_certification = Ac.age_certification;

alter table Movie drop column age_certification;

