-- ======================================================================
-- Q24
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 24. Insert an employee using only selected columns, leaving salary and hire_date NULL.
--
-- NOTE: Run Q21 first.
-- ======================================================================

USE sql_lab;

INSERT INTO employees (emp_id,name,department) VALUES (107,'David Clark','Sales');
