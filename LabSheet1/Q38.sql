-- ============================================================
-- Q38 | Section B (Medium) | ALTER - Add Column FIRST
-- Question: Add transaction_date (DATETIME) as the absolute first column in the
-- financial_ledger table using ALTER.
-- ============================================================
USE lab1_db;

ALTER TABLE financial_ledger
ADD COLUMN transaction_date DATETIME FIRST;

-- Verify
DESCRIBE financial_ledger;
