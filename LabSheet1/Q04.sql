-- ============================================================
-- Q04 | Section A (Easy) | Create Table
-- Question: Create a table audit_logs storing log_id (Primary Key), action (TEXT), and
-- created_at using TIMESTAMP.
-- ============================================================
USE lab1_db;

CREATE TABLE audit_logs (
    log_id     INT PRIMARY KEY,
    action     TEXT,
    created_at TIMESTAMP
);

-- Verify
DESCRIBE audit_logs;
