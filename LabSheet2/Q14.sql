-- ============================================================
-- Q14 | Section A (Easy) | Range Filtering
-- Question: Retrieve all orders placed between '2024-01-15' and '2024-01-20'.
-- ============================================================
USE lab2_db;

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-15' AND '2024-01-20';
