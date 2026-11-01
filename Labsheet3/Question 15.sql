-- Q15: Demonstrate the implicit-commit effect of DDL in MySQL.
USE company_db;

START TRANSACTION;

UPDATE employees
SET salary = 85000.00
WHERE emp_id = 101;

-- ALTER TABLE causes an implicit COMMIT in MySQL.
-- Therefore, the UPDATE above is committed before the ALTER TABLE runs.
ALTER TABLE employees ADD COLUMN ddl_demo_note VARCHAR(20);

-- This ROLLBACK cannot undo the UPDATE or the ALTER TABLE.
ROLLBACK;

-- Optional cleanup (also DDL and therefore implicitly committed):
ALTER TABLE employees DROP COLUMN ddl_demo_note;
