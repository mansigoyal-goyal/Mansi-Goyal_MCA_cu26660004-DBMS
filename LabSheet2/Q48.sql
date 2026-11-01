-- ============================================================
-- Q48 | Section C (Hard) | Complex Group Filtering
-- Question: List customer names who have placed more than 1 order OR have a total spending
-- sum > 1000.00.
-- ============================================================
USE lab2_db;

SELECT customer_name,
       COUNT(*)          AS order_count,
       SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_name
HAVING COUNT(*) > 1 OR SUM(total_amount) > 1000.00;
