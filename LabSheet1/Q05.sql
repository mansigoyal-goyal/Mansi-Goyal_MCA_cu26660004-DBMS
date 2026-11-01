-- ============================================================
-- Q05 | Section A (Easy) | Create Table
-- Question: Write a DDL query to create a table products with product_id (Primary Key),
-- product_name (VARCHAR 50), and is_available using BOOLEAN.
-- ============================================================
USE lab1_db;

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    is_available BOOLEAN
);

-- Verify
DESCRIBE products;
