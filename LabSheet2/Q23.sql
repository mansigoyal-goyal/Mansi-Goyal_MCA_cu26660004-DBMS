-- ============================================================
-- Q23 | Section B (Medium) | Complex Updates
-- Question: Deactivate (set is_active = FALSE) all employees hired before '2021-01-01'.
-- ============================================================
USE lab2_db;

UPDATE employees
SET is_active = FALSE
WHERE hire_date < '2021-01-01';

SELECT * FROM employees;
