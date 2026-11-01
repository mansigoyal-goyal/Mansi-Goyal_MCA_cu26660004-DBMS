-- ============================================================
-- Q40 | Section B (Medium) | Bulk Updates
-- Question: Update all orders with amount under 200.00 to have status 'Cancelled'.
-- ============================================================
USE lab2_db;

UPDATE orders
SET status = 'Cancelled'
WHERE total_amount < 200.00;

SELECT * FROM orders;
