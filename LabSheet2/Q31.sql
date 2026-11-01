-- ============================================================
-- Q31 | Section B (Medium) | Grouping & Aggregation
-- Question: Find maximum and minimum order amounts per order status.
-- ============================================================
USE lab2_db;

SELECT status,
       MAX(total_amount) AS max_amount,
       MIN(total_amount) AS min_amount
FROM orders
GROUP BY status;
