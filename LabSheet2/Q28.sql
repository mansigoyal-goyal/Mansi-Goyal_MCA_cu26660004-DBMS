-- ============================================================
-- Q28 | Section B (Medium) | Grouping & Aggregation
-- Question: Calculate total salary expenditure for each department.
-- ============================================================
USE lab2_db;

SELECT dept_id, SUM(salary) AS total_salary_expenditure
FROM employees
GROUP BY dept_id;
