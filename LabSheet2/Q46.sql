-- ============================================================
-- Q46 | Section C (Hard) | Correlated Subqueries & DML
-- Question: Delete employees who are inactive (is_active = FALSE) AND earn less than their
-- department's average salary.
-- ============================================================
USE lab2_db;

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
