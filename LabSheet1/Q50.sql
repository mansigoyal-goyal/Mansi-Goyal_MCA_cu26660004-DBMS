-- ============================================================
-- Q50 | Section C (Hard) | Create + Modify
-- Question: Write the SQL DDL statements to: (1) Create table application_logs with log_id
-- (BIGINT Primary Key), level (ENUM('DEBUG', 'INFO', 'WARN', 'ERROR')), message (TEXT),
-- execution_time (DOUBLE), and created_at (DATETIME), and (2) Modify the level column to
-- VARCHAR(10).
-- ============================================================
USE lab1_db;

-- (1) Create table
CREATE TABLE application_logs (
    log_id         BIGINT PRIMARY KEY,
    level          ENUM('DEBUG', 'INFO', 'WARN', 'ERROR'),
    message        TEXT,
    execution_time DOUBLE,
    created_at     DATETIME
);

-- (2) Modify column
ALTER TABLE application_logs
MODIFY COLUMN level VARCHAR(10);

-- Verify
DESCRIBE application_logs;
