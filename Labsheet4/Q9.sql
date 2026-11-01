-- ======================================================================
-- Q9
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 9. Try to insert a student with DeptID = 99. Explain the result.
--
-- NOTE: Needs the foreign key from Q7 to exist.
-- ======================================================================

USE sql_lab;

-- Explanation: Department has no DeptID 99, so the foreign key constraint stops the
-- insert. A child row cannot point to a parent row that does not exist.

-- The next statement is EXPECTED to fail with:
-- ERROR - Cannot add or update a child row: a foreign key constraint fails
INSERT INTO Student VALUES (106,'Riya Das','riya@example.com',21,99,'2026-08-01');
