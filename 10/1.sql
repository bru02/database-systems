drop table if exists Follows;
drop table if exists Posts;
drop table if exists Users;

create table Users (
    ID int identity primary key not null,
    username varchar(100) not null unique,
    role varchar(50),
    created_at datetime default getdate()
);

create table Follows (
    FollowingUserId int foreign key references Users(ID),
    FollowedUserId int foreign key references Users(ID),
    created_at datetime default getdate(),
    primary key (FollowedUserId, FollowingUserId)
);

create table Posts (
    ID int identity primary key not null,
    UserId int foreign key references Users(ID),
    title nvarchar(100) not null,
    body text not null,
    status bit,
    created_at datetime default getdate()
);

-- Insert test data into Users
INSERT INTO Users (username, role)
VALUES
    ('john_doe', 'admin'),
    ('jane_smith', 'editor'),
    ('alice_jones', 'viewer'),
    ('bob_brown', 'viewer'),
    ('charlie_clark', 'admin'),
    ('daisy_adams', 'editor');

-- Insert test data into Follows
-- Users following other users
INSERT INTO Follows (FollowingUserId, FollowedUserId)
VALUES
    (1, 2), -- john_doe follows jane_smith
    (2, 3), -- jane_smith follows alice_jones
    (3, 4), -- alice_jones follows bob_brown
    (4, 1), -- bob_brown follows john_doe
    (1, 5), -- john_doe follows charlie_clark
    (2, 6), -- jane_smith follows daisy_adams
    (3, 1), -- alice_jones follows john_doe
    (4, 6), -- bob_brown follows daisy_adams
    (5, 3), -- charlie_clark follows alice_jones
    (6, 2); -- daisy_adams follows jane_smith

-- Insert test data into Posts
-- Users creating posts
INSERT INTO Posts (UserId, title, body, status)
VALUES
    (1, 'Introduction to SQL', 'SQL stands for Structured Query Language.', 0),
    (1, 'Database Optimization', 'Tips on optimizing your database.', 1),
    (2, 'How to Edit Articles', 'A guide for new editors.', 0),
    (2, 'The Power of Collaboration', 'Why teamwork is essential.', 0),
    (3, 'Viewer’s Perspective', 'Thoughts from a content viewer.', 0),
    (4, 'Upcoming Features', 'Exciting updates coming soon.', 1),
    (5, 'Admin Guide', 'How to manage users effectively.', 0),
    (6, 'Editorial Workflow', 'Streamlining the editorial process.', 0),
    (6, 'Content Strategies', 'Effective strategies for content.', 0);
