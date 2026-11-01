-- ============================================================
-- Q14 | Section A (Easy) | ALTER - Modify Column
-- Question: Write a command to change the data type of email in employees from VARCHAR(100)
-- to VARCHAR(150).
-- ============================================================
USE lab1_db;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(150);

-- Verify
DESCRIBE employees;
