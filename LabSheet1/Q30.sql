-- ============================================================
-- Q30 | Section B (Medium) | Create Table
-- Question: Create a table device_logs with log_id (BIGINT Primary Key), ip_address (VARCHAR
-- 45), and payload (LONGBLOB).
-- ============================================================
USE lab1_db;

CREATE TABLE device_logs (
    log_id     BIGINT PRIMARY KEY,
    ip_address VARCHAR(45),
    payload    LONGBLOB
);

-- Verify
DESCRIBE device_logs;
