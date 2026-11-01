-- ============================================================
-- Q34 | Section B (Medium) | ALTER - Rename Column
-- Question: Change column content in document_store to doc_body while maintaining its
-- LONGTEXT type.
-- ============================================================
USE lab1_db;

ALTER TABLE document_store
CHANGE COLUMN content doc_body LONGTEXT;

-- Verify
DESCRIBE document_store;
