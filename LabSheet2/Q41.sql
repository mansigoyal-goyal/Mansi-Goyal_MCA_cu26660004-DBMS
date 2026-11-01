-- ============================================================
-- Q41 | Section C (Hard) | Advanced Subqueries & DML
-- Question: Increase salary by 15% for employees working in the department with the highest
-- budget.
-- ============================================================
USE lab2_db;

UPDATE employees
SET salary = salary * 1.15
WHERE dept_id = (SELECT dept_id
                 FROM departments
                 WHERE budget = (SELECT MAX(budget) FROM departments));

SELECT * FROM employees;
