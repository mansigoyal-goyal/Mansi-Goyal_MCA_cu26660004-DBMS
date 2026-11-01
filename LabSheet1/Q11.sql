-- ============================================================
-- Q11 | Section A (Easy) | Create Table
-- Question: Create a table user_profiles with user_id (Primary Key), bio (TEXT), and
-- profile_pic (BLOB).
-- ============================================================
USE lab1_db;

CREATE TABLE user_profiles (
    user_id     INT PRIMARY KEY,
    bio         TEXT,
    profile_pic BLOB
);

-- Verify
DESCRIBE user_profiles;
