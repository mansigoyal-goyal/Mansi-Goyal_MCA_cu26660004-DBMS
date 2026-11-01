-- ============================================================
-- Q15 | Section A (Easy) | Set Filtering
-- Question: Display all departments located in either 'Building A' or 'Building B'.
-- ============================================================
USE lab2_db;

SELECT *
FROM departments
WHERE location IN ('Building A', 'Building B');
