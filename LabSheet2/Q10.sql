-- ============================================================
-- Q10 | Section A (Easy) | Updating Records
-- Question: Increase the budget of department 20 by 20000.00.
-- ============================================================
USE lab2_db;

UPDATE departments
SET budget = budget + 20000.00
WHERE dept_id = 20;

SELECT * FROM departments WHERE dept_id = 20;
