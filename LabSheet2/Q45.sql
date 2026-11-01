-- ============================================================
-- Q45 | Section C (Hard) | Conditional Updates (CASE)
-- Question: Update employees: Increase salary by 10% if salary < 60000, else increase by 5%
-- using a CASE expression.
-- ============================================================
USE lab2_db;

UPDATE employees
SET salary = CASE
                WHEN salary < 60000 THEN salary * 1.10
                ELSE salary * 1.05
             END;

SELECT * FROM employees;
