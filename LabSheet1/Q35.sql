-- ============================================================
-- Q35 | Section B (Medium) | CREATE TABLE ... LIKE
-- Question: Write a DDL command to create an empty table structure employees_archive
-- identical in layout and constraints to the employees table.
-- ============================================================
USE lab1_db;

CREATE TABLE employees_archive LIKE employees;

-- Verify
DESCRIBE employees_archive;
