-- ============================================================
-- Q10 | Section A (Easy) | TRUNCATE
-- Question: Write a command to empty all records from audit_logs without dropping the table
-- structure.
-- ============================================================
USE lab1_db;

TRUNCATE TABLE audit_logs;

-- Verify
SELECT COUNT(*) AS rows_left FROM audit_logs;
DESCRIBE audit_logs;
