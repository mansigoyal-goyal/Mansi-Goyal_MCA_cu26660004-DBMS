-- ============================================================
-- Q47 | Section C (Hard) | Scalar Subqueries in Projection
-- Question: Find department name and total employee count using a scalar subquery in the
-- SELECT projection list.
-- ============================================================
USE lab2_db;

SELECT d.dept_name,
       (SELECT COUNT(*)
        FROM employees e
        WHERE e.dept_id = d.dept_id) AS total_employees
FROM departments d;
