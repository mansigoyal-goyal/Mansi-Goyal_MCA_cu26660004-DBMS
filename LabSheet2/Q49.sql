-- ============================================================
-- Q49 | Section C (Hard) | Data Transformation & Copying
-- Question: Insert into employees a copy of all employees from department 10 into department
-- 50 with modified IDs (+500).
-- ============================================================
USE lab2_db;

INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
SELECT emp_id + 500, first_name, last_name, 50, salary, hire_date, is_active
FROM employees
WHERE dept_id = 10;

SELECT * FROM employees;
