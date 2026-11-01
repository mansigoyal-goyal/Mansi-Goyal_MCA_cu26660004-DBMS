-- ============================================================
-- Q48 | Section C (Hard) | ALTER - Multiple Changes
-- Question: Modify file_metadata schema in one ALTER statement: Change file_id from INT to
-- BIGINT, alter file_path to TEXT, and drop column checksum.
-- ============================================================
USE lab1_db;

ALTER TABLE file_metadata
MODIFY COLUMN file_id BIGINT NOT NULL,
MODIFY COLUMN file_path TEXT,
DROP COLUMN checksum;

-- Verify
DESCRIBE file_metadata;
