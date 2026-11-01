-- ============================================================
-- Q24 | Section B (Medium) | Multi-Condition Filtering
-- Question: Retrieve all active employees (is_active = TRUE) who earn more than 60000.00.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE is_active = TRUE AND salary > 60000.00;
