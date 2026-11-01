-- ======================================================================
-- Q46
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 46. List Computer Science students alphabetically by name.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students WHERE course = 'Computer Science' ORDER BY student_name ASC;
