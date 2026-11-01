-- ======================================================================
-- Q36
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 36. Update Lisa Wilson's salary to 47,000 and hire date to 2024-03-05.
--
-- NOTE: Questions 34-39 change the data one after another, so run them in order (Q21-Q24 first). Re-run Q21-Q24 to reset.
-- ======================================================================

USE sql_lab;

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = 47000, hire_date = '2024-03-05' WHERE name = 'Lisa Wilson';

-- Check the result:

SELECT * FROM employees;
