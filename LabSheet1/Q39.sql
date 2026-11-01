-- ============================================================
-- Q39 | Section B (Medium) | Create Table
-- Question: Create a table measurements with sample_id (INT Primary Key) and value (DOUBLE).
-- ============================================================
USE lab1_db;

CREATE TABLE measurements (
    sample_id INT PRIMARY KEY,
    `value`   DOUBLE
);
-- (backticks around `value` are optional in MySQL but make the name safe)

-- Verify
DESCRIBE measurements;
