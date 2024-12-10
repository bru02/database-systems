create table #csar
(
    id    int         not null,
    title varchar(15) not null
);

INSERT INTO #csar (id, title)
VALUES (1, 'Title A'),
       (2, 'Title B'),
       (3, 'Title C'),
       (3, 'Title C Dup'), -- Identifiant dupliqué intentionnellement
       (4, 'Title D'),
       (5, 'Title E'),
       (5, 'Title E Dup'); -- Identifiant dupliqué intention

-- nellement