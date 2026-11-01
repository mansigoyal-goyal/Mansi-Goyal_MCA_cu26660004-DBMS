-- Q30: Complete administrative maintenance script.
-- Run as an administrator/root account because CREATE USER, GRANT,
-- account locking and privilege auditing require suitable administrative rights.
USE company_db;

CREATE USER IF NOT EXISTS 'test_maint'@'localhost'
IDENTIFIED BY 'ChangeThis_StrongPassword!';

GRANT SELECT, INSERT, UPDATE ON company_db.* TO 'test_maint'@'localhost';

-- Perform a test update and then undo it.
START TRANSACTION;

UPDATE employees
SET is_active = TRUE
WHERE emp_id = 104;

ROLLBACK;

-- Audit current permissions.
SHOW GRANTS FOR 'test_maint'@'localhost';

-- Revoke the granted permissions.
REVOKE SELECT, INSERT, UPDATE ON company_db.* FROM 'test_maint'@'localhost';

-- Lock the account to prevent new connections.
ALTER USER 'test_maint'@'localhost' ACCOUNT LOCK;

SHOW GRANTS FOR 'test_maint'@'localhost';
