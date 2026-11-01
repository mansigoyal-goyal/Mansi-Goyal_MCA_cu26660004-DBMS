-- ============================================================
-- Q42 | Section C (Hard) | Group Aggregations & Subqueries
-- Question: Find departments where average employee salary is greater than the global
-- average employee salary.
-- ============================================================
USE lab2_db;

SELECT dept_id, AVG(salary) AS avg_dept_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);
