-- ============================================================
-- Q21 | Section B (Medium) | Multi-Row Insert
-- Question: Insert two new employees ('George Clark', dept_id 30, salary 50000.00, hire_date
-- '2024-02-05', TRUE) and ('Hannah Abbott', dept_id 10, salary 71000.00, hire_date
-- '2024-02-10', TRUE) into the employees table in a single query.
-- ============================================================
USE lab2_db;

-- emp_id values are not given in the question, so 107 and 108 are used
INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
VALUES
  (107, 'George', 'Clark',  30, 50000.00, '2024-02-05', TRUE),
  (108, 'Hannah', 'Abbott', 10, 71000.00, '2024-02-10', TRUE);

SELECT * FROM employees;
