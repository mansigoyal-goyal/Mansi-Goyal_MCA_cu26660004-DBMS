-- ============================================================
-- Q27 | Section B (Medium) | ALTER - Column Position
-- Question: Add a column middle_name (VARCHAR 30) to employees specifically positioned right
-- after given_name.
-- ============================================================
USE lab1_db;

ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(30) AFTER given_name;

-- Verify
DESCRIBE employees;
