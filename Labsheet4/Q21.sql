-- ======================================================================
-- Q21
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 21. Create an employees table with emp_id, name, department, salary and hire_date.
-- ======================================================================

USE sql_lab;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(80),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
