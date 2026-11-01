-- ======================================================================
-- Q39
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 39. Change department to Senior Staff for employees hired before February 1, 2024.
--
-- NOTE: Questions 34-39 change the data one after another, so run them in order (Q21-Q24 first). Re-run Q21-Q24 to reset.
-- ======================================================================

USE sql_lab;

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET department = 'Senior Staff' WHERE hire_date < '2024-02-01';

-- Check the result:

SELECT * FROM employees;
