-- Q22: Lock employee 101 for update, then change the salary.
USE company_db;
START TRANSACTION;

SELECT emp_id, salary
FROM employees
WHERE emp_id = 101
FOR UPDATE;

UPDATE employees
SET salary = 88000.00
WHERE emp_id = 101;

COMMIT;
