-- ============================================================
-- Q26 | Section B (Medium) | ALTER - Modify Column
-- Question: Write a DDL command to change the bio column in user_profiles from TEXT to
-- MEDIUMTEXT.
-- ============================================================
USE lab1_db;

ALTER TABLE user_profiles
MODIFY COLUMN bio MEDIUMTEXT;

-- Verify
DESCRIBE user_profiles;
