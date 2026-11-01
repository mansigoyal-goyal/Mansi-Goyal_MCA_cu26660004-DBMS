-- ======================================================================
-- Q16
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 16. Create a Library table where BookID must be UNIQUE. Insert five books.
-- ======================================================================

USE sql_lab;

DROP TABLE IF EXISTS Library;

CREATE TABLE Library (
    BookID INT UNIQUE,
    Title VARCHAR(150) NOT NULL
);

INSERT INTO Library VALUES
(1,'Database Systems'),
(2,'Operating Systems'),
(3,'Computer Networks'),
(4,'Python Programming'),
(5,'Data Mining');

SELECT * FROM Library;
