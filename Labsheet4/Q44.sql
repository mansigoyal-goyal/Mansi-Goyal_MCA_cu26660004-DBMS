-- ======================================================================
-- Q44
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 44. Display students sorted by marks in descending order.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students ORDER BY marks DESC;
