-- ============================================================
-- Q35 | Section B (Medium) | NULL Handling
-- Question: Find all employees whose last_name is NULL (if any exists).
-- ============================================================
USE lab2_db;

SELECT *
FROM employees
WHERE last_name IS NULL;
-- (Empty result = no employee has a NULL last_name)
