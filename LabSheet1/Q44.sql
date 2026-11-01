-- ============================================================
-- Q44 | Section C (Hard) | ALTER - Rename + Modify + Add
-- Question: You have a table raw_data with column temp_val (VARCHAR 50). In a single ALTER
-- command, rename column temp_val to converted_val, change its type to DECIMAL(6,3), and add
-- column processed_at (TIMESTAMP) right after it.
-- ============================================================
USE lab1_db;

-- Prerequisite: the 'existing' table is created here.
CREATE TABLE raw_data (
    temp_val VARCHAR(50)
);

-- Answer (CHANGE COLUMN renames and changes the type in one go):
ALTER TABLE raw_data
CHANGE COLUMN temp_val converted_val DECIMAL(6,3),
ADD COLUMN processed_at TIMESTAMP AFTER converted_val;

-- Verify
DESCRIBE raw_data;
