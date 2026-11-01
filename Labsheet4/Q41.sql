-- ======================================================================
-- Q41
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 41. Delete Electronics items priced over 1000.
--
-- NOTE: The products table comes from database_setup.sql. Questions 40-43 delete rows one after another, so run them in order. Re-run database_setup.sql to get the rows back.
-- ======================================================================

USE sql_lab;

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

DELETE FROM products WHERE category = 'Electronics' AND price > 1000;

-- Check the result:

SELECT * FROM products;
