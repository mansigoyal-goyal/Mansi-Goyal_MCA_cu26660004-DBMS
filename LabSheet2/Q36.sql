-- ============================================================
-- Q36 | Section B (Medium) | String Functions
-- Question: Display full names of employees by concatenating first_name and last_name with a
-- space.
-- ============================================================
USE lab2_db;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;
