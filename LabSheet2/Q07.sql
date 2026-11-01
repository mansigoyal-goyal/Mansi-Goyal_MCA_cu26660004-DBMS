-- ============================================================
-- Q07 | Section A (Easy) | Data Retrieval & Filtering
-- Question: Display all orders where the status is 'Completed'.
-- ============================================================
USE lab2_db;

SELECT *
FROM orders
WHERE status = 'Completed';
