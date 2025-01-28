.mode column
.headers off

DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS studios;

CREATE TABLE studios (
    studio_id   INTEGER PRIMARY KEY,
    name        TEXT
);

CREATE TABLE movies (
    movie_id     INTEGER PRIMARY KEY,
    title        TEXT,
    release_year INTEGER,
    mpaa_rating  TEXT,
    studio_id    INTEGER,
    FOREIGN KEY(studio_id) REFERENCES studios(studio_id)
);

CREATE TABLE actors (
    actor_id   INTEGER PRIMARY KEY,
    name       TEXT
);

CREATE TABLE roles (
    role_id        INTEGER PRIMARY KEY,
    movie_id       INTEGER,
    actor_id       INTEGER,
    character_name TEXT,
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY(actor_id) REFERENCES actors(actor_id)
);
INSERT INTO studios (studio_id, name) VALUES
(1, 'Warner Bros.');

INSERT INTO movies (movie_id, title, release_year, mpaa_rating, studio_id) VALUES
(1, 'Batman Begins', 2005, 'PG-13', 1),
(2, 'The Dark Knight', 2008, 'PG-13', 1),
(3, 'The Dark Knight Rises', 2012, 'PG-13', 1);

INSERT INTO actors (actor_id, name) VALUES
(1,  'Christian Bale'),
(2,  'Michael Caine'),
(3,  'Liam Neeson'),
(4,  'Katie Holmes'),
(5,  'Gary Oldman'),
(6,  'Heath Ledger'),
(7,  'Aaron Eckhart'),
(8,  'Maggie Gyllenhaal'),
(9,  'Tom Hardy'),
(10, 'Joseph Gordon-Levitt'),
(11, 'Anne Hathaway');

INSERT INTO roles (role_id, movie_id, actor_id, character_name) VALUES
(1, 1, 1,  'Bruce Wayne'),
(2, 1, 2,  'Alfred'),
(3, 1, 3,  'Ra''s Al Ghul'),
(4, 1, 4,  'Rachel Dawes'),
(5, 1, 5,  'Commissioner Gordon'),
(6, 2, 1,  'Bruce Wayne'),
(7, 2, 6,  'Joker'),
(8, 2, 7,  'Harvey Dent'),
(9, 2, 2,  'Alfred'),
(10,2, 8,  'Rachel Dawes'),
(11,3, 1,  'Bruce Wayne'),
(12,3, 5,  'Commissioner Gordon'),
(13,3, 9,  'Bane'),
(14,3,10,  'John Blake'),
(15,3,11,  'Selina Kyle');

.print "Movies"
.print "======"
.print ""

SELECT m.title,
       m.release_year,
       m.mpaa_rating,
       s.name
  FROM movies m
  JOIN studios s ON m.studio_id = s.studio_id
 ORDER BY m.movie_id;

 .print ""
.print "Top Cast"
.print "========"
.print ""

SELECT m.title,
       a.name,
       r.character_name
  FROM roles r
  JOIN movies m ON r.movie_id = m.movie_id
  JOIN actors a ON r.actor_id = a.actor_id
 ORDER BY m.movie_id, r.role_id;