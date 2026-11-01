-- ======================================================================
-- Q49
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 49. Display students whose names start with 'A'.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students WHERE student_name LIKE 'A%';
