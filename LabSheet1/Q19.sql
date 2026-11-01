-- ============================================================
-- Q19 | Section A (Easy) | Create Table
-- Question: Create a table clients with client_id (INT Primary Key) and registration_time
-- (TIME).
-- ============================================================
USE lab1_db;

CREATE TABLE clients (
    client_id         INT PRIMARY KEY,
    registration_time TIME
);

-- Verify
DESCRIBE clients;
