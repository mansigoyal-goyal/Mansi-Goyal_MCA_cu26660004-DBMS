-- Q23: Acquire a shared lock on department 10 for an analytical report.
USE company_db;
START TRANSACTION;

SELECT dept_id, dept_name, budget
FROM departments
WHERE dept_id = 10
FOR SHARE;

-- Run reporting SELECT statements while this transaction is open.
SELECT dept_id, dept_name, budget
FROM departments
WHERE dept_id = 10;

COMMIT;
