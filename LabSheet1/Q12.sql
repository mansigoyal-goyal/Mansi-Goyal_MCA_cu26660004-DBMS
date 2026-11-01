-- ============================================================
-- Q12 | Section A (Easy) | Create Table - ENUM
-- Question: Create a table ticket_orders with ticket_id (Primary Key) and priority_level
-- restricted to ENUM('Low', 'Medium', 'High').
-- ============================================================
USE lab1_db;

CREATE TABLE ticket_orders (
    ticket_id      INT PRIMARY KEY,
    priority_level ENUM('Low', 'Medium', 'High')
);

-- Verify
DESCRIBE ticket_orders;
