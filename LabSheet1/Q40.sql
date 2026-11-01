-- ============================================================
-- Q40 | Section B (Medium) | Create Table
-- Question: Create a table app_users with user_id (INT Primary Key) and status_code
-- (TINYINT).
-- ============================================================
USE lab1_db;

CREATE TABLE app_users (
    user_id     INT PRIMARY KEY,
    status_code TINYINT
);

-- Verify
DESCRIBE app_users;
