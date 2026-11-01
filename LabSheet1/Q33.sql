-- ============================================================
-- Q33 | Section B (Medium) | Create Table
-- Question: Create a table document_store with doc_id (INT Primary Key), doc_title (VARCHAR
-- 255), and content (LONGTEXT).
-- ============================================================
USE lab1_db;

CREATE TABLE document_store (
    doc_id    INT PRIMARY KEY,
    doc_title VARCHAR(255),
    content   LONGTEXT
);

-- Verify
DESCRIBE document_store;
