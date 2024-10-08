select TrackId, Name, isnull(Composer, 'No composer'), Milliseconds / 60000 as Minutes, Bytes / 1024 / 1024 as MB,
        len(Composer) - len(replace(replace(Composer, ',', ''), '/', '')) + 1 as Composers,
        rank() over (order by len(Composer) - len(replace(replace(Composer, ',', ''), '/', '')) + 1 desc)

from Track
where UnitPrice between 1.0 and 2.0
and (Composer like '%/%' or Composer like '%,%')