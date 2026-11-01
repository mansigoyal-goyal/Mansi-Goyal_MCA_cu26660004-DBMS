-- ============================================================
-- Q27 | Section B (Medium) | Pattern Matching
-- Question: Find all employees whose first_name contains the letter 'a' (case-insensitive).
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE LOWER(first_name) LIKE '%a%';
