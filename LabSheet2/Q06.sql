-- ============================================================
-- Q06 | Section A (Easy) | Data Retrieval & Filtering
-- Question: Find all employees who belong to department 10.
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE dept_id = 10;
