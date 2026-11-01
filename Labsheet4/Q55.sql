-- ======================================================================
-- Q55
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 55. Display loan details with book title and member name using joins.
--
-- NOTE: Run Q51-Q54 first.
-- ======================================================================

USE sql_lab;

SELECT l.loan_id, b.title, m.name, l.loan_date, l.return_date
FROM Loans l
INNER JOIN Books b ON l.book_id = b.book_id
INNER JOIN Members m ON l.member_id = m.member_id;
