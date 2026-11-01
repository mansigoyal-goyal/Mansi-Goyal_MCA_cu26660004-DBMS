-- ============================================================
-- Q37 | Section B (Medium) | Ordering & Limits
-- Question: Retrieve the top 3 highest-paid employees.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
