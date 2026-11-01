-- ============================================================
-- Q32 | Section B (Medium) | Subqueries
-- Question: Retrieve all employees who earn more than the average employee salary.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
