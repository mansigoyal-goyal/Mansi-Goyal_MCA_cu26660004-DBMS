-- ============================================================
-- Q31 | Section B (Medium) | ALTER - Change Primary Key
-- Question: Drop the existing primary key of order_items, add a new column order_item_id
-- (INT) at the first position, and set it as the new primary key in a single ALTER command
-- chain.
-- ============================================================
USE lab1_db;

ALTER TABLE order_items
DROP PRIMARY KEY,
ADD COLUMN order_item_id INT FIRST,
ADD PRIMARY KEY (order_item_id);

-- Verify
DESCRIBE order_items;
