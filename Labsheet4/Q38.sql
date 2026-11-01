-- ======================================================================
-- Q38
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 38. Add 2,000 to all Finance employees.
--
-- NOTE: Questions 34-39 change the data one after another, so run them in order (Q21-Q24 first). Re-run Q21-Q24 to reset.
-- ======================================================================

USE sql_lab;

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = salary + 2000 WHERE department = 'Finance';

-- Check the result:

SELECT * FROM employees;
