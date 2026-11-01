-- Q12: Update employee 101, create a savepoint, update 102,
-- roll back the second update, and commit the first update.
USE company_db;
START TRANSACTION;

UPDATE employees
SET salary = 80000.00
WHERE emp_id = 101;

SAVEPOINT sp_first;

UPDATE employees
SET salary = 95000.00
WHERE emp_id = 102;

ROLLBACK TO SAVEPOINT sp_first;
COMMIT;

-- Result: employee 101's salary update is committed.
-- Employee 102's salary remains unchanged.
