-- ============================================================
-- Q12 | Section A (Easy) | Deleting Records
-- Question: Remove employee 'Diana Prince' (emp_id 104) from the employees table.
-- ============================================================
USE lab2_db;

DELETE FROM employees
WHERE emp_id = 104;

SELECT * FROM employees;
