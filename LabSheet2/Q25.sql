-- ============================================================
-- Q25 | Section B (Medium) | Multi-Condition Filtering
-- Question: Find orders that are either 'Cancelled' OR have a total_amount greater than
-- 2000.00.
-- ============================================================
USE lab2_db;

SELECT *
FROM orders
WHERE status = 'Cancelled' OR total_amount > 2000.00;
