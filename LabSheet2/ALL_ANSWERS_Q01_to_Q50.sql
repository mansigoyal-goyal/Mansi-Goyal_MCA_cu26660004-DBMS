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

-- ============================================================
-- Q01 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new employee 'Fiona Gallagher' into the employees table with ID 106,
-- dept_id 10, salary 65000.00, hire_date '2024-02-01', and is_active TRUE.
-- ============================================================
INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
VALUES (106, 'Fiona', 'Gallagher', 10, 65000.00, '2024-02-01', TRUE);

SELECT * FROM employees;

-- ============================================================
-- Q02 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new department 'Quality Assurance' located in 'Building B' with a
-- budget of 250000.00 into departments, setting dept_id to 60.
-- ============================================================
INSERT INTO departments (dept_id, dept_name, location, budget)
VALUES (60, 'Quality Assurance', 'Building B', 250000.00);

SELECT * FROM departments;

-- ============================================================
-- Q03 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new order for customer 'Delta Retail' dated '2024-01-28' worth 2100.00
-- with status 'Pending' into orders.
-- ============================================================
-- order_id is AUTO_INCREMENT, so it is generated automatically (5006)
INSERT INTO orders (customer_name, order_date, total_amount, status)
VALUES ('Delta Retail', '2024-01-28', 2100.00, 'Pending');

SELECT * FROM orders;

-- ============================================================
-- Q04 | Section A (Easy) | Data Retrieval
-- Question: Retrieve all columns from the employees table.
-- ============================================================
SELECT * FROM employees;

-- ============================================================
-- Q05 | Section A (Easy) | Data Retrieval
-- Question: Retrieve only the first_name, last_name, and salary of all employees.
-- ============================================================
SELECT first_name, last_name, salary
FROM employees;

-- ============================================================
-- Q06 | Section A (Easy) | Data Retrieval & Filtering
-- Question: Find all employees who belong to department 10.
-- ============================================================
SELECT *
FROM employees
WHERE dept_id = 10;

-- ============================================================
-- Q07 | Section A (Easy) | Data Retrieval & Filtering
-- Question: Display all orders where the status is 'Completed'.
-- ============================================================
SELECT *
FROM orders
WHERE status = 'Completed';

-- ============================================================
-- Q08 | Section A (Easy) | Updating Records
-- Question: Update the salary of employee with emp_id 102 to 55000.00.
-- ============================================================
UPDATE employees
SET salary = 55000.00
WHERE emp_id = 102;

SELECT * FROM employees WHERE emp_id = 102;

-- ============================================================
-- Q09 | Section A (Easy) | Updating Records
-- Question: Change the status of order 5002 from 'Pending' to 'Shipped'.
-- ============================================================
UPDATE orders
SET status = 'Shipped'
WHERE order_id = 5002 AND status = 'Pending';

SELECT * FROM orders WHERE order_id = 5002;

-- ============================================================
-- Q10 | Section A (Easy) | Updating Records
-- Question: Increase the budget of department 20 by 20000.00.
-- ============================================================
UPDATE departments
SET budget = budget + 20000.00
WHERE dept_id = 20;

SELECT * FROM departments WHERE dept_id = 20;

-- ============================================================
-- Q11 | Section A (Easy) | Deleting Records
-- Question: Delete the order record with order_id 5004 from the orders table.
-- ============================================================
DELETE FROM orders
WHERE order_id = 5004;

SELECT * FROM orders;

-- ============================================================
-- Q12 | Section A (Easy) | Deleting Records
-- Question: Remove employee 'Diana Prince' (emp_id 104) from the employees table.
-- ============================================================
DELETE FROM employees
WHERE emp_id = 104;

SELECT * FROM employees;

-- ============================================================
-- Q13 | Section A (Easy) | Condition Filtering
-- Question: Find all employees with a salary greater than 60000.00.
-- ============================================================
SELECT *
FROM employees
WHERE salary > 60000.00;

-- ============================================================
-- Q14 | Section A (Easy) | Range Filtering
-- Question: Retrieve all orders placed between '2024-01-15' and '2024-01-20'.
-- ============================================================
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-15' AND '2024-01-20';

-- ============================================================
-- Q15 | Section A (Easy) | Set Filtering
-- Question: Display all departments located in either 'Building A' or 'Building B'.
-- ============================================================
SELECT *
FROM departments
WHERE location IN ('Building A', 'Building B');

-- ============================================================
-- Q16 | Section A (Easy) | Pattern Matching
-- Question: Find all employees whose last_name starts with the letter 'S'.
-- ============================================================
SELECT *
FROM employees
WHERE last_name LIKE 'S%';

-- ============================================================
-- Q17 | Section A (Easy) | Sorting Results
-- Question: List all employees sorted by salary in descending order.
-- ============================================================
SELECT *
FROM employees
ORDER BY salary DESC;

-- ============================================================
-- Q18 | Section A (Easy) | Sorting Results
-- Question: Retrieve all departments sorted alphabetically by department name.
-- ============================================================
SELECT *
FROM departments
ORDER BY dept_name ASC;

-- ============================================================
-- Q19 | Section A (Easy) | Basic Aggregation
-- Question: Count the total number of records in the employees table.
-- ============================================================
SELECT COUNT(*) AS total_employees
FROM employees;

-- ============================================================
-- Q20 | Section A (Easy) | Basic Aggregation
-- Question: Calculate the average total_amount of all orders.
-- ============================================================
SELECT AVG(total_amount) AS average_order_amount
FROM orders;

-- ============================================================
-- Q21 | Section B (Medium) | Multi-Row Insert
-- Question: Insert two new employees ('George Clark', dept_id 30, salary 50000.00, hire_date
-- '2024-02-05', TRUE) and ('Hannah Abbott', dept_id 10, salary 71000.00, hire_date
-- '2024-02-10', TRUE) into the employees table in a single query.
-- ============================================================
-- emp_id values are not given in the question, so 107 and 108 are used
INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
VALUES
  (107, 'George', 'Clark',  30, 50000.00, '2024-02-05', TRUE),
  (108, 'Hannah', 'Abbott', 10, 71000.00, '2024-02-10', TRUE);

SELECT * FROM employees;

-- ============================================================
-- Q22 | Section B (Medium) | Complex Updates
-- Question: Give a 10% salary raise to all employees working in department 10.
-- ============================================================
UPDATE employees
SET salary = salary * 1.10
WHERE dept_id = 10;

SELECT * FROM employees WHERE dept_id = 10;

-- ============================================================
-- Q23 | Section B (Medium) | Complex Updates
-- Question: Deactivate (set is_active = FALSE) all employees hired before '2021-01-01'.
-- ============================================================
UPDATE employees
SET is_active = FALSE
WHERE hire_date < '2021-01-01';

SELECT * FROM employees;

-- ============================================================
-- Q24 | Section B (Medium) | Multi-Condition Filtering
-- Question: Retrieve all active employees (is_active = TRUE) who earn more than 60000.00.
-- ============================================================
SELECT *
FROM employees
WHERE is_active = TRUE AND salary > 60000.00;

-- ============================================================
-- Q25 | Section B (Medium) | Multi-Condition Filtering
-- Question: Find orders that are either 'Cancelled' OR have a total_amount greater than
-- 2000.00.
-- ============================================================
SELECT *
FROM orders
WHERE status = 'Cancelled' OR total_amount > 2000.00;

-- ============================================================
-- Q26 | Section B (Medium) | Set Exclusion
-- Question: List all employees who do NOT belong to departments 10 or 30.
-- ============================================================
SELECT *
FROM employees
WHERE dept_id NOT IN (10, 30);

-- ============================================================
-- Q27 | Section B (Medium) | Pattern Matching
-- Question: Find all employees whose first_name contains the letter 'a' (case-insensitive).
-- ============================================================
SELECT *
FROM employees
WHERE LOWER(first_name) LIKE '%a%';

-- ============================================================
-- Q28 | Section B (Medium) | Grouping & Aggregation
-- Question: Calculate total salary expenditure for each department.
-- ============================================================
SELECT dept_id, SUM(salary) AS total_salary_expenditure
FROM employees
GROUP BY dept_id;

-- ============================================================
-- Q29 | Section B (Medium) | Grouping & Aggregation
-- Question: Find the total number of employees in each department.
-- ============================================================
SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id;

-- ============================================================
-- Q30 | Section B (Medium) | Group Filtering (HAVING)
-- Question: Display departments that have a total salary expense exceeding 100000.00.
-- ============================================================
SELECT dept_id, SUM(salary) AS total_salary_expense
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 100000.00;

-- ============================================================
-- Q31 | Section B (Medium) | Grouping & Aggregation
-- Question: Find maximum and minimum order amounts per order status.
-- ============================================================
SELECT status,
       MAX(total_amount) AS max_amount,
       MIN(total_amount) AS min_amount
FROM orders
GROUP BY status;

-- ============================================================
-- Q32 | Section B (Medium) | Subqueries
-- Question: Retrieve all employees who earn more than the average employee salary.
-- ============================================================
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ============================================================
-- Q33 | Section B (Medium) | Subqueries
-- Question: Find all employees who work in departments located in 'Building A'.
-- ============================================================
SELECT *
FROM employees
WHERE dept_id IN (SELECT dept_id
                  FROM departments
                  WHERE location = 'Building A');

-- ============================================================
-- Q34 | Section B (Medium) | Nested Deletions
-- Question: Delete all orders placed by customers who have an order with 'Cancelled' status.
-- ============================================================
-- MySQL does not allow a subquery on the same table being deleted from (Error 1093),
-- so the inner query is wrapped in a derived table.
DELETE FROM orders
WHERE customer_name IN (
    SELECT customer_name
    FROM (SELECT customer_name FROM orders WHERE status = 'Cancelled') AS cancelled_customers
);

-- Note: if Q11 was already run (order 5004 deleted), no 'Cancelled' orders remain, so 0 rows are deleted.
SELECT * FROM orders;

-- ============================================================
-- Q35 | Section B (Medium) | NULL Handling
-- Question: Find all employees whose last_name is NULL (if any exists).
-- ============================================================
SELECT *
FROM employees
WHERE last_name IS NULL;
-- (Empty result = no employee has a NULL last_name)

-- ============================================================
-- Q36 | Section B (Medium) | String Functions
-- Question: Display full names of employees by concatenating first_name and last_name with a
-- space.
-- ============================================================
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- ============================================================
-- Q37 | Section B (Medium) | Ordering & Limits
-- Question: Retrieve the top 3 highest-paid employees.
-- ============================================================
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- ============================================================
-- Q38 | Section B (Medium) | Multi-Column Ordering
-- Question: List employees sorted by department ID ascending, then by salary descending.
-- ============================================================
SELECT *
FROM employees
ORDER BY dept_id ASC, salary DESC;

-- ============================================================
-- Q39 | Section B (Medium) | Complex Deletions
-- Question: Delete all departments that have a budget less than 200000.00.
-- ============================================================
DELETE FROM departments
WHERE budget < 200000.00;

SELECT * FROM departments;

-- ============================================================
-- Q40 | Section B (Medium) | Bulk Updates
-- Question: Update all orders with amount under 200.00 to have status 'Cancelled'.
-- ============================================================
UPDATE orders
SET status = 'Cancelled'
WHERE total_amount < 200.00;

SELECT * FROM orders;

-- ============================================================
-- Q41 | Section C (Hard) | Advanced Subqueries & DML
-- Question: Increase salary by 15% for employees working in the department with the highest
-- budget.
-- ============================================================
UPDATE employees
SET salary = salary * 1.15
WHERE dept_id = (SELECT dept_id
                 FROM departments
                 WHERE budget = (SELECT MAX(budget) FROM departments));

SELECT * FROM employees;

-- ============================================================
-- Q42 | Section C (Hard) | Group Aggregations & Subqueries
-- Question: Find departments where average employee salary is greater than the global
-- average employee salary.
-- ============================================================
SELECT dept_id, AVG(salary) AS avg_dept_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

-- ============================================================
-- Q43 | Section C (Hard) | Relational Subqueries
-- Question: Display employee details for employees who belong to departments with a budget >
-- 300000.00.
-- ============================================================
SELECT *
FROM employees
WHERE dept_id IN (SELECT dept_id
                  FROM departments
                  WHERE budget > 300000.00);

-- ============================================================
-- Q44 | Section C (Hard) | Offset & Ranking
-- Question: Find the third highest salary in the employees table using subqueries or OFFSET.
-- ============================================================
-- Method 1: OFFSET
SELECT DISTINCT salary AS third_highest_salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- Method 2: Subquery
SELECT MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary)
                FROM employees
                WHERE salary < (SELECT MAX(salary) FROM employees));

-- ============================================================
-- Q45 | Section C (Hard) | Conditional Updates (CASE)
-- Question: Update employees: Increase salary by 10% if salary < 60000, else increase by 5%
-- using a CASE expression.
-- ============================================================
UPDATE employees
SET salary = CASE
                WHEN salary < 60000 THEN salary * 1.10
                ELSE salary * 1.05
             END;

SELECT * FROM employees;

-- ============================================================
-- Q46 | Section C (Hard) | Correlated Subqueries & DML
-- Question: Delete employees who are inactive (is_active = FALSE) AND earn less than their
-- department's average salary.
-- ============================================================
-- Correlated version (works in standard SQL; MySQL needs the derived table below because of Error 1093):
--   DELETE FROM employees e
--   WHERE e.is_active = FALSE
--     AND e.salary < (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id);

-- MySQL-compatible version (join with per-department averages):
DELETE e
FROM employees e
JOIN (SELECT dept_id, AVG(salary) AS avg_salary
      FROM employees
      GROUP BY dept_id) d ON e.dept_id = d.dept_id
WHERE e.is_active = FALSE
  AND e.salary < d.avg_salary;

SELECT * FROM employees;

-- ============================================================
-- Q47 | Section C (Hard) | Scalar Subqueries in Projection
-- Question: Find department name and total employee count using a scalar subquery in the
-- SELECT projection list.
-- ============================================================
SELECT d.dept_name,
       (SELECT COUNT(*)
        FROM employees e
        WHERE e.dept_id = d.dept_id) AS total_employees
FROM departments d;

-- ============================================================
-- Q48 | Section C (Hard) | Complex Group Filtering
-- Question: List customer names who have placed more than 1 order OR have a total spending
-- sum > 1000.00.
-- ============================================================
SELECT customer_name,
       COUNT(*)          AS order_count,
       SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_name
HAVING COUNT(*) > 1 OR SUM(total_amount) > 1000.00;

-- ============================================================
-- Q49 | Section C (Hard) | Data Transformation & Copying
-- Question: Insert into employees a copy of all employees from department 10 into department
-- 50 with modified IDs (+500).
-- ============================================================
INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
SELECT emp_id + 500, first_name, last_name, 50, salary, hire_date, is_active
FROM employees
WHERE dept_id = 10;

SELECT * FROM employees;

-- ============================================================
-- Q50 | Section C (Hard) | Multi-Branch CASE Updates
-- Question: Bulk update order statuses: 'Completed' if total_amount > 1000, 'Shipped' if
-- between 500 and 1000, else 'Pending'.
-- ============================================================
UPDATE orders
SET status = CASE
                WHEN total_amount > 1000              THEN 'Completed'
                WHEN total_amount BETWEEN 500 AND 1000 THEN 'Shipped'
                ELSE 'Pending'
             END;

SELECT * FROM orders;

