select Album.AlbumId as [Album/@Id], Title as [Album]
from Album
for xml path(''), root('albums')