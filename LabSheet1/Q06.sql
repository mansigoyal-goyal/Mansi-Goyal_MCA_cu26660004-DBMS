-- ============================================================
-- Q06 | Section A (Easy) | Create Table
-- Question: Create a table system_settings with setting_id (SMALLINT Primary Key),
-- setting_key (VARCHAR 50), and setting_value (VARCHAR 100).
-- ============================================================
USE lab1_db;

CREATE TABLE system_settings (
    setting_id    SMALLINT PRIMARY KEY,
    setting_key   VARCHAR(50),
    setting_value VARCHAR(100)
);

-- Verify
DESCRIBE system_settings;
