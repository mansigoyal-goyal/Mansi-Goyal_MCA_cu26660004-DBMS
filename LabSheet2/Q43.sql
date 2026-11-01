-- ============================================================
-- Q43 | Section C (Hard) | Relational Subqueries
-- Question: Display employee details for employees who belong to departments with a budget >
-- 300000.00.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE dept_id IN (SELECT dept_id
                  FROM departments
                  WHERE budget > 300000.00);
