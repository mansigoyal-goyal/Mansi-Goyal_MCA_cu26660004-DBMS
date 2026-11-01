-- ============================================================
-- Q16 | Section A (Easy) | Pattern Matching
-- Question: Find all employees whose last_name starts with the letter 'S'.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE last_name LIKE 'S%';
