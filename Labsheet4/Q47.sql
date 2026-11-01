-- ======================================================================
-- Q47
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 47. Show the bottom 3 scorers.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students ORDER BY marks ASC LIMIT 3;
