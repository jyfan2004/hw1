-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS cast_info;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movie (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_released INTEGER,
    rating TEXT,
    studio_id INTEGER
);

CREATE TABLE studio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE actor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    character_id INTEGER
);

CREATE TABLE character (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE cast_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INTEGER,
    actor_id INTEGER,
    character_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

INSERT INTO movie (
    title,
    year_released,
    rating,
    studio_id
)
VALUES (
    "Batman Begins",
    2005,
    "PG-13",
    1
),
(
    "The Dark Knight",
    2008,
    "PG-13",
    1
),
(
    "The Dark Knight Rises",
    2012,
    "PG-13",
    1
);

INSERT INTO studio (
    name
)
VALUES (
    "Warner Bros."
);

INSERT INTO character(
    name
)
VALUES (
    "Bruce Wayne" --1
),
(
    "Alfred" --2
),
(
    "Ra's Al Ghul" --3
),
(
    "Rachel Dawes" --4
),
(
    "Commissioner Gordon" --5
),
(
    "Joker" --6
),
(
    "Harvey Dent" --7
),
(
    "Bane" --8
),
(
    "John Blake" --9
),
(
    "Selina Kyle" --10
);

INSERT INTO actor (
    name,
    character_id
)
VALUES (
    "Christian Bale", --1
    1
),
(
    "Michael Caine", --2
    2
),
(
    "Liam Neeson", --3
    3
),
(
    "Katie Holmes", --4
    4
),
(
    "Gary Oldman", --5
    5
),
(
    "Heath Ledger", --6
    6
),
(
    "Aaron Eckhart", --7
    7
),
(
    "Maggie Gyllenhaal", --8
    4
),
(
    "Tom Hardy", --9
    8
),
(
    "Joseph Gordon-Levitt", --10
    9
),
(
    "Anne Hathaway", --11
    10
);

INSERT INTO cast_info (
    movie_id,
    actor_id,
    character_id
)
VALUES (
    1, 1, 1
),
(
    1, 2, 2
),
(
    1, 3, 3
),
(
    1, 4, 4
),
(
    1, 5, 5
),
(
    2, 1, 1
),
(
    2, 6, 6
),
(
    2, 7, 7
),
(
    2, 2, 2
),
(
    2, 8, 4
),
(
    3, 1, 1
),
(
    3, 5, 5
),
(
    3, 9, 8
),
(
    3, 10, 9
),
(
    3, 11, 10
);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
select title, year_released, rating, studio.name
from movie
inner join studio on studio.id = movie.studio_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
select movie.title, actor.name, character.name
from cast_info 
inner join movie on movie.id = cast_info.movie_id
inner join actor on actor.id = cast_info.actor_id
inner join character on character.id = cast_info.character_id;