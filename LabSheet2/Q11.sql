-- ============================================================
-- Q11 | Section A (Easy) | Deleting Records
-- Question: Delete the order record with order_id 5004 from the orders table.
-- ============================================================
USE lab2_db;

DELETE FROM orders
WHERE order_id = 5004;

SELECT * FROM orders;
