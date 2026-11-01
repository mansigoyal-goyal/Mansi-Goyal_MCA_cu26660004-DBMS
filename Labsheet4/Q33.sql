-- ======================================================================
-- Q33
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 33. Find maximum, minimum and average salary.
-- ======================================================================

USE sql_lab;

-- MAX, MIN and AVG ignore NULL salaries (David Clark has none).

SELECT MAX(salary) AS maximum_salary,
       MIN(salary) AS minimum_salary,
       AVG(salary) AS average_salary
FROM employees;
