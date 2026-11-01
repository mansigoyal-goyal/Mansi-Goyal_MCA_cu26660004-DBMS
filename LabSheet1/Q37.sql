-- ============================================================
-- Q37 | Section B (Medium) | Create Table
-- Question: Create a table financial_ledger with entry_id (BIGINT Primary Key), debit
-- (DECIMAL 15,4), and credit (DECIMAL 15,4).
-- ============================================================
USE lab1_db;

CREATE TABLE financial_ledger (
    entry_id BIGINT PRIMARY KEY,
    debit    DECIMAL(15,4),
    credit   DECIMAL(15,4)
);

-- Verify
DESCRIBE financial_ledger;
