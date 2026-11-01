-- Q24: Limit auditor to 100 queries per hour and 2 simultaneous connections.
ALTER USER 'auditor'@'localhost'
WITH MAX_QUERIES_PER_HOUR 100
     MAX_USER_CONNECTIONS 2;

-- Verify account grants (resource limits are managed on the account).
SHOW GRANTS FOR 'auditor'@'localhost';
