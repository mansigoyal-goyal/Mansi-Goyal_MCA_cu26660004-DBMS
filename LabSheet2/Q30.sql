-- ============================================================
-- Q30 | Section B (Medium) | Group Filtering (HAVING)
-- Question: Display departments that have a total salary expense exceeding 100000.00.
-- ============================================================
USE lab2_db;

SELECT dept_id, SUM(salary) AS total_salary_expense
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 100000.00;
