-- ============================================================
-- Q15 | Section A (Easy) | Create Table
-- Question: Create a table sensor_data with read_id (BIGINT Primary Key) and temperature
-- (FLOAT).
-- ============================================================
USE lab1_db;

CREATE TABLE sensor_data (
    read_id     BIGINT PRIMARY KEY,
    temperature FLOAT
);

-- Verify
DESCRIBE sensor_data;
