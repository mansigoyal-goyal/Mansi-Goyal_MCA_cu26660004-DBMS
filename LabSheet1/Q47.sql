-- ============================================================
-- Q47 | Section C (Hard) | Create Table
-- Question: Create table file_metadata with file_id (INT Primary Key), file_path (VARCHAR
-- 500), file_size_bytes (BIGINT), and checksum (CHAR 64).
-- ============================================================
USE lab1_db;

CREATE TABLE file_metadata (
    file_id         INT PRIMARY KEY,
    file_path       VARCHAR(500),
    file_size_bytes BIGINT,
    checksum        CHAR(64)
);

-- Verify
DESCRIBE file_metadata;
