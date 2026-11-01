-- ============================================================
-- Q41 | Section C (Hard) | Create Table - Design
-- Question: Design a transactions table with an xact_id (BIGINT Primary Key), user_id (INT),
-- amount (DECIMAL 10,2), channel (ENUM('Web', 'Mobile', 'ATM')), status (VARCHAR 20), and
-- xact_time (TIMESTAMP).
-- ============================================================
USE lab1_db;

CREATE TABLE transactions (
    xact_id   BIGINT PRIMARY KEY,
    user_id   INT,
    amount    DECIMAL(10,2),
    channel   ENUM('Web', 'Mobile', 'ATM'),
    status    VARCHAR(20),
    xact_time TIMESTAMP
);

-- Verify
DESCRIBE transactions;
