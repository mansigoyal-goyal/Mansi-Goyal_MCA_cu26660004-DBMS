-- ============================================================
-- Q33 | Section B (Medium) | Subqueries
-- Question: Find all employees who work in departments located in 'Building A'.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE dept_id IN (SELECT dept_id
                  FROM departments
                  WHERE location = 'Building A');
