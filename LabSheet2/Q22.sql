-- ============================================================
-- Q22 | Section B (Medium) | Complex Updates
-- Question: Give a 10% salary raise to all employees working in department 10.
-- ============================================================
USE lab2_db;

UPDATE employees
SET salary = salary * 1.10
WHERE dept_id = 10;

SELECT * FROM employees WHERE dept_id = 10;
