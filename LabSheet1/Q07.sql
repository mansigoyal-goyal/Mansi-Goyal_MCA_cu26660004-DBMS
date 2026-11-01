-- ============================================================
-- Q07 | Section A (Easy) | ALTER - Add Column
-- Question: Write an ALTER command to add a new column email (VARCHAR 100) to the existing
-- employees table.
-- ============================================================
USE lab1_db;

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

-- Verify
DESCRIBE employees;
