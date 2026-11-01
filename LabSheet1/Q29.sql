-- ============================================================
-- Q29 | Section B (Medium) | Create Table - ENUM
-- Question: Create a table user_accounts with user_id (BIGINT Primary Key), account_type
-- (ENUM('Standard', 'Premium', 'Admin')), and created_timestamp (TIMESTAMP).
-- ============================================================
USE lab1_db;

CREATE TABLE user_accounts (
    user_id           BIGINT PRIMARY KEY,
    account_type      ENUM('Standard', 'Premium', 'Admin'),
    created_timestamp TIMESTAMP
);

-- Verify
DESCRIBE user_accounts;
