-- ============================================================
-- Q50 | Section C (Hard) | Multi-Branch CASE Updates
-- Question: Bulk update order statuses: 'Completed' if total_amount > 1000, 'Shipped' if
-- between 500 and 1000, else 'Pending'.
-- ============================================================
USE lab2_db;

UPDATE orders
SET status = CASE
                WHEN total_amount > 1000              THEN 'Completed'
                WHEN total_amount BETWEEN 500 AND 1000 THEN 'Shipped'
                ELSE 'Pending'
             END;

SELECT * FROM orders;
