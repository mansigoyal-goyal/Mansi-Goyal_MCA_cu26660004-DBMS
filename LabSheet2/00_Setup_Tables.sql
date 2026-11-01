-- ============================================================
-- Lab Sheet 2 - SETUP (run this FIRST, and again any time you want to reset the data)
-- Database Technologies (MCA105P) | MySQL / MariaDB syntax
-- ============================================================
DROP DATABASE IF EXISTS lab2_db;
CREATE DATABASE lab2_db;
USE lab2_db;

CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)    NOT NULL,
    location  VARCHAR(50),
    budget    DECIMAL(12,2)
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,
    last_name  VARCHAR(50),
    dept_id    INT,
    salary     DECIMAL(10,2),
    hire_date  DATE,
    is_active  BOOLEAN
);

CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    order_date    DATE,
    total_amount  DECIMAL(10,2),
    status        VARCHAR(20)
);

INSERT INTO departments VALUES
 (10, 'Engineering',     'Building A', 500000.00),
 (20, 'Marketing',       'Building B', 200000.00),
 (30, 'Human Resources', 'Building A', 150000.00),
 (40, 'Finance',         'Building C', 350000.00),
 (50, 'Research',        'Building D', 600000.00);

INSERT INTO employees VALUES
 (101, 'Alice',   'Smith',   10, 75000.00, '2021-03-15', TRUE),
 (102, 'Bob',     'Johnson', 20, 52000.00, '2022-06-01', TRUE),
 (103, 'Charlie', 'Brown',   10, 82000.00, '2019-11-20', TRUE),
 (104, 'Diana',   'Prince',  30, 48000.00, '2023-01-10', FALSE),
 (105, 'Evan',    'Wright',  20, 61000.00, '2020-08-05', TRUE);

INSERT INTO orders VALUES
 (5001, 'TechCorp LLC', '2024-01-15', 1250.50, 'Completed'),
 (5002, 'Global Media', '2024-01-18',  450.00, 'Pending'),
 (5003, 'Alpha Retail', '2024-01-20', 3100.00, 'Completed'),
 (5004, 'Beta Systems', '2024-01-22',  150.25, 'Cancelled'),
 (5005, 'Gamma Inc',    '2024-01-25',  890.00, 'Shipped');

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM orders;
