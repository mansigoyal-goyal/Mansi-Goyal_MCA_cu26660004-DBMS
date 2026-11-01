-- ============================================================
-- Q36 | Section B (Medium) | DROP IF EXISTS
-- Question: Write a DDL query to drop table employees_archive safely only if it exists in
-- the schema.
-- ============================================================
USE lab1_db;

DROP TABLE IF EXISTS employees_archive;

-- Verify
SHOW TABLES;
