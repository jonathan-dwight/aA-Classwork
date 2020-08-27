PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS users; 
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;  
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);
   
-- to visualize in sql, do a join table  
-- any _id is a foreign key that needs to be linked with a primary key elsewhere

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    qref_id INTEGER NOT NULL,
    uref_id INTEGER NOT NULL,
    pref_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (qref_id) REFERENCES questions(id),
    FOREIGN KEY (uref_id) REFERENCES users(id),
    FOREIGN KEY (pref_id) REFERENCES replies(id)
);
-- use conventional naming going forward w foreign keys i.e. question_id, user_id, parent_id

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_like_ref_id INTEGER,

    FOREIGN KEY (user_like_ref_id) REFERENCES users(id),
    FOREIGN KEY (user_like_ref_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('John', 'Doe'),
    ('George', 'Orwell'),
    ('Marge', 'Piercy'),
    ('Kurt', 'Vonnegut');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('NAME FRAUD','Why do people always copy my name?', 1 ),
    ('I know its 2020 but....', 'Why put narwahls on a farm?', 2),
    ('Covid Fever', 'When is my next book signing?', 3),
    ('Where''s my magnifying glass', 'Did you see the cats cradle?', 4);