-- ======================================================================
-- Q48
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 48. List students with marks between 80 and 90.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

-- BETWEEN includes both 80 and 90.

SELECT * FROM students WHERE marks BETWEEN 80 AND 90;
