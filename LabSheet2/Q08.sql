-- ============================================================
-- Q08 | Section A (Easy) | Updating Records
-- Question: Update the salary of employee with emp_id 102 to 55000.00.
-- ============================================================
USE lab2_db;

UPDATE employees
SET salary = 55000.00
WHERE emp_id = 102;

SELECT * FROM employees WHERE emp_id = 102;
