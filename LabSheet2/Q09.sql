-- ============================================================
-- Q09 | Section A (Easy) | Updating Records
-- Question: Change the status of order 5002 from 'Pending' to 'Shipped'.
-- ============================================================
USE lab2_db;

UPDATE orders
SET status = 'Shipped'
WHERE order_id = 5002 AND status = 'Pending';

SELECT * FROM orders WHERE order_id = 5002;
