-- ============================================================
-- Q26 | Section B (Medium) | Set Exclusion
-- Question: List all employees who do NOT belong to departments 10 or 30.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE dept_id NOT IN (10, 30);
