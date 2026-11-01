-- ======================================================================
-- Q50
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 50. Show students from Mumbai or Delhi.
--
-- NOTE: The students table comes from database_setup.sql.
-- ======================================================================

USE sql_lab;

SELECT * FROM students WHERE city IN ('Mumbai','Delhi');
