-- Q14: Set the current transaction to READ ONLY before reporting queries.
SET TRANSACTION READ ONLY;
START TRANSACTION;

SELECT emp_id, first_name, last_name, dept_id, salary
FROM company_db.employees;

COMMIT;
