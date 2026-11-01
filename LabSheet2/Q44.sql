-- ============================================================
-- Q44 | Section C (Hard) | Offset & Ranking
-- Question: Find the third highest salary in the employees table using subqueries or OFFSET.
-- ============================================================
USE lab2_db;

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
