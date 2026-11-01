-- Q27: Deadlock simulation. Run Session 1 and Session 2 in TWO
-- separate MySQL connections. Use InnoDB tables.
--
-- SESSION 1 (login as dev_user):
START TRANSACTION;
UPDATE company_db.employees SET salary = salary + 100 WHERE emp_id = 101;
-- Now run the Session 2 statements before continuing:
UPDATE company_db.employees SET salary = salary + 100 WHERE emp_id = 102;
COMMIT;

-- SESSION 2 (login as hr_assistant, in a separate connection):
-- Run these statements after Session 1 has locked employee 101:
-- START TRANSACTION;
-- UPDATE company_db.employees SET salary = salary + 200 WHERE emp_id = 102;
-- UPDATE company_db.employees SET salary = salary + 200 WHERE emp_id = 101;
-- COMMIT;
--
-- Deadlock sequence:
-- 1. Session 1 locks row 101.
-- 2. Session 2 locks row 102.
-- 3. Session 1 requests row 102 and waits.
-- 4. Session 2 requests row 101 and waits.
-- InnoDB detects the cycle and aborts one transaction as the deadlock victim.
-- The victim should issue ROLLBACK (or reconnect/restart its transaction).
