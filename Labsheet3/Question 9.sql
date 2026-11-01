-- Q09: Refresh MySQL privilege tables after direct changes to grant tables.
-- Normally GRANT/REVOKE apply immediately; FLUSH PRIVILEGES is needed
-- after direct manual changes to the mysql system privilege tables.
FLUSH PRIVILEGES;
