-- ======================================================================
-- Q53
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 53. Create Loans with loan_id as PRIMARY KEY, book_id and member_id as FOREIGN KEYs, loan_date and nullable return_date.
--
-- NOTE: Run Q51 and Q52 first.
-- ======================================================================

USE sql_lab;

-- Books and Members (Q51, Q52) must exist first because Loans refers to them.

DROP TABLE IF EXISTS Loans;

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
