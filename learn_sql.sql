DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
CREATE TABLE authors (
    authors_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL, 
    birth_year INT
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    publish_date DATE, 

    authors_id INT REFERENCES authors(authors_id)
);


INSERT INTO authors (full_name, birth_year) VALUES ('Robert C. Martin', 1952);
INSERT INTO authors (full_name, birth_year) VALUES ('Naval Ravikant', 1974);

INSERT INTO books (title, publish_date, authors_id) VALUES ('Clean Code', '2008-08-01', 1);
INSERT INTO books (title, publish_date, authors_id) VALUES ('The Almanack of Naval Ravikant', '2020-09-01', 2);

SELECT books.title, books.publish_date, authors.full_name
FROM books
JOIN authors ON books.authors_id = authors.authors_id;


SELECT title, publish_date
FROM books
WHERE publish_date > '2010-1-1';

UPDATE books
SET publish_date = '2020-8-18'
WHERE title = 'The Almanack of Naval Ravikant';

SELECT * FROM books WHERE title = 'The Almanack of Naval Ravikant';

DELETE FROM books WHERE title = 'Clean Code';

SELECT * FROM books;