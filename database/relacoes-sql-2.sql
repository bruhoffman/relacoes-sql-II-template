-- Active: 1722988879811@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
    ('u001', 'Fulano', 'fulando@email.com', '123'),
    ('u002', 'Ciclano', 'ciclano@email.com', '456'),
    ('u003', 'Beltrano', 'beltrano@email.com', '789');

SELECT * FROM users;

CREATE TABLE follows (
    follower_id TEXt NOT NULL, -- SEGUIDOR
    followed_id TEXT NOT NULL, -- SEGUIDO
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

-- Pessoa A segue as pessoas B e C
-- Pessoa B segue a pessoa A
-- Pessoa C não segue ninguém

INSERT INTO follows VALUES
('u001', 'u002'),
('u001', 'u003'),
('u002', 'u001')

SELECT * FROM follows;

SELECT * FROM users;

SELECT * FROM follows
INNER JOIN users
ON follows.followed_id = users.id;

SELECT * FROM follows
RIGHT JOIN users
ON follows.followed_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON users.id = follows.follower_id;

SELECT users.id, users.name, users2.id, users2.name FROM users
LEFT JOIN follows ON users.id = follows.follower_id
LEFT JOIN users AS users2 ON follows.followed_id = users2.id