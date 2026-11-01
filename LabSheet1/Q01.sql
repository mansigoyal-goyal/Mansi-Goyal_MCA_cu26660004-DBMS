-- ============================================================
-- Q01 | Section A (Easy) | Create Table
-- Question: Write a DDL statement to create an empty table named departments with an integer
-- dept_id as the primary key and a dept_name of up to 50 characters.
-- ============================================================
USE lab1_db;

CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Verify
DESCRIBE departments;
