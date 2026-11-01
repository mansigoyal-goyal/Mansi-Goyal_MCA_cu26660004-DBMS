-- Q16: Transfer 10,000 from department 10 to department 20 atomically.
-- finance_user needs UPDATE permission on company_db.departments (provided).
USE company_db;
START TRANSACTION;

UPDATE departments
SET budget = budget - 10000.00
WHERE dept_id = 10 AND budget >= 10000.00;

-- Confirm exactly one row was affected before continuing.
SELECT ROW_COUNT() AS debit_rows_affected;

UPDATE departments
SET budget = budget + 10000.00
WHERE dept_id = 20;

-- Check both department balances, then commit if correct.
SELECT dept_id, budget
FROM departments
WHERE dept_id IN (10, 20);

-- If both updates are correct:
COMMIT;
-- If validation fails, execute ROLLBACK instead of COMMIT.
