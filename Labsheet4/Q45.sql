-- ======================================================================
-- Q45
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 45. Show the top 5 scorers.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students ORDER BY marks DESC LIMIT 5;
