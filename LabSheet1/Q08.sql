-- ============================================================
-- Q08 | Section A (Easy) | ALTER - Drop Column
-- Question: Write an ALTER statement to remove the is_available column from the products
-- table.
-- ============================================================
USE lab1_db;

ALTER TABLE products
DROP COLUMN is_available;

-- Verify
DESCRIBE products;
