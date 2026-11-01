-- ============================================================
-- Q17 | Section A (Easy) | ALTER - Rename Column
-- Question: Rename column first_name to given_name in the employees table using DDL.
-- ============================================================
USE lab1_db;

ALTER TABLE employees
RENAME COLUMN first_name TO given_name;
-- Older MySQL (5.7) alternative:
-- ALTER TABLE employees CHANGE first_name given_name VARCHAR(30);

-- Verify
DESCRIBE employees;
