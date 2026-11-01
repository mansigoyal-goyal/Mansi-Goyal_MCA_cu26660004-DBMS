-- ============================================================
-- Q03 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new order for customer 'Delta Retail' dated '2024-01-28' worth 2100.00
-- with status 'Pending' into orders.
-- ============================================================
USE lab2_db;

-- order_id is AUTO_INCREMENT, so it is generated automatically (5006)
INSERT INTO orders (customer_name, order_date, total_amount, status)
VALUES ('Delta Retail', '2024-01-28', 2100.00, 'Pending');

SELECT * FROM orders;
