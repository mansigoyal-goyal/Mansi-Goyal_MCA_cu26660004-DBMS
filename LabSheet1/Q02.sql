-- ============================================================
-- Q02 | Section A (Easy) | Create Table
-- Question: Write a DDL query to create a table employees with an emp_id (Primary Key),
-- first_name (VARCHAR 30), and salary (DECIMAL 10,2).
-- ============================================================
USE lab1_db;

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    first_name VARCHAR(30),
    salary     DECIMAL(10,2)
);

-- Verify
DESCRIBE employees;
