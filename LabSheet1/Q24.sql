-- ============================================================
-- Q24 | Section B (Medium) | ALTER - Drop + Modify
-- Question: In the table employees, drop column email and change salary data type to
-- DECIMAL(12,2) in a single ALTER statement.
-- ============================================================
USE lab1_db;

ALTER TABLE employees
DROP COLUMN email,
MODIFY COLUMN salary DECIMAL(12,2);

-- Verify
DESCRIBE employees;
