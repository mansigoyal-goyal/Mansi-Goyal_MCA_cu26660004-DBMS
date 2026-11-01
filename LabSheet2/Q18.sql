-- ============================================================
-- Q18 | Section A (Easy) | Sorting Results
-- Question: Retrieve all departments sorted alphabetically by department name.
-- ============================================================
USE lab2_db;

SELECT *
FROM departments
ORDER BY dept_name ASC;
