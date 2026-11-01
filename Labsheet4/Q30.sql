-- ======================================================================
-- Q30
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 30. Find employees hired in January 2024.
-- ======================================================================

USE sql_lab;

SELECT * FROM employees WHERE hire_date BETWEEN '2024-01-01' AND '2024-01-31';
