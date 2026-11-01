-- ============================================================
-- Q34 | Section B (Medium) | Nested Deletions
-- Question: Delete all orders placed by customers who have an order with 'Cancelled' status.
-- ============================================================
USE lab2_db;

-- MySQL does not allow a subquery on the same table being deleted from (Error 1093),
-- so the inner query is wrapped in a derived table.
DELETE FROM orders
WHERE customer_name IN (
    SELECT customer_name
    FROM (SELECT customer_name FROM orders WHERE status = 'Cancelled') AS cancelled_customers
);

-- Note: if Q11 was already run (order 5004 deleted), no 'Cancelled' orders remain, so 0 rows are deleted.
SELECT * FROM orders;
