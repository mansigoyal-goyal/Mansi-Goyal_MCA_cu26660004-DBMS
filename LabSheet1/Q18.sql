-- ============================================================
-- Q18 | Section A (Easy) | ALTER - Drop Primary Key
-- Question: Write an ALTER command to drop the primary key constraint from the
-- system_settings table.
-- ============================================================
USE lab1_db;

ALTER TABLE system_settings
DROP PRIMARY KEY;

-- Verify
DESCRIBE system_settings;
