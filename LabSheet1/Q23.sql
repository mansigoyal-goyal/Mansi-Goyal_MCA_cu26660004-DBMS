-- ============================================================
-- Q23 | Section B (Medium) | ALTER - Add Multiple Columns
-- Question: Modify the employees table to add two new columns in a single DDL statement:
-- hire_date (DATE) and is_active (BOOLEAN).
-- ============================================================
USE lab1_db;

ALTER TABLE employees
ADD COLUMN hire_date DATE,
ADD COLUMN is_active BOOLEAN;

-- Verify
DESCRIBE employees;
