-- ======================================================================
-- Q51
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 51. Create Books with book_id as PRIMARY KEY, title as NOT NULL, author, isbn as UNIQUE and genre.
-- ======================================================================

USE sql_lab;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Books;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    isbn VARCHAR(13) UNIQUE,
    genre VARCHAR(50)
);
