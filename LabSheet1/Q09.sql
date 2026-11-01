-- ============================================================
-- Q09 | Section A (Easy) | RENAME Table
-- Question: Write the SQL DDL command to rename the table departments to dept_units.
-- ============================================================
USE lab1_db;

RENAME TABLE departments TO dept_units;
-- Alternative: ALTER TABLE departments RENAME TO dept_units;

-- Verify
SHOW TABLES;
