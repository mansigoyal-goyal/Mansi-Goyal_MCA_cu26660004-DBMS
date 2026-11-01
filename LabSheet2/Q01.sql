-- ============================================================
-- Q01 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new employee 'Fiona Gallagher' into the employees table with ID 106,
-- dept_id 10, salary 65000.00, hire_date '2024-02-01', and is_active TRUE.
-- ============================================================
USE lab2_db;

INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
VALUES (106, 'Fiona', 'Gallagher', 10, 65000.00, '2024-02-01', TRUE);

SELECT * FROM employees;
