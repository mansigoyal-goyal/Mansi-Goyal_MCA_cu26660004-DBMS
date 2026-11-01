-- ============================================================
-- Q38 | Section B (Medium) | Multi-Column Ordering
-- Question: List employees sorted by department ID ascending, then by salary descending.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
ORDER BY dept_id ASC, salary DESC;
