-- ======================================================================
-- Q37
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 37. Change department to Operations where salary is below 50,000.
--
-- NOTE: Questions 34-39 change the data one after another, so run them in order (Q21-Q24 first). Re-run Q21-Q24 to reset.
-- ======================================================================

USE sql_lab;

-- Rows with a NULL salary (David Clark) do not match 'salary < 50000'.

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET department = 'Operations' WHERE salary < 50000;

-- Check the result:

SELECT * FROM employees;
