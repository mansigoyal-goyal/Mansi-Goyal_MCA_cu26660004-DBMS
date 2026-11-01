-- ============================================================
-- Q29 | Section B (Medium) | Grouping & Aggregation
-- Question: Find the total number of employees in each department.
-- ============================================================
USE lab2_db;

SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id;
