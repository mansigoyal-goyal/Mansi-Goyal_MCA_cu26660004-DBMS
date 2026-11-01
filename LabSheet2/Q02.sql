-- ============================================================
-- Q02 | Section A (Easy) | Basic Data Insertion
-- Question: Insert a new department 'Quality Assurance' located in 'Building B' with a
-- budget of 250000.00 into departments, setting dept_id to 60.
-- ============================================================
USE lab2_db;

INSERT INTO departments (dept_id, dept_name, location, budget)
VALUES (60, 'Quality Assurance', 'Building B', 250000.00);

SELECT * FROM departments;
