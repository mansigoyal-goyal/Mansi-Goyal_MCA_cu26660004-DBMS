-- ============================================================
-- Q20 | Section A (Easy) | Basic Aggregation
-- Question: Calculate the average total_amount of all orders.
-- ============================================================
USE lab2_db;

SELECT AVG(total_amount) AS average_order_amount
FROM orders;
