-- ============================================================
-- Q39 | Section B (Medium) | Complex Deletions
-- Question: Delete all departments that have a budget less than 200000.00.
-- ============================================================
USE lab2_db;

DELETE FROM departments
WHERE budget < 200000.00;

SELECT * FROM departments;
