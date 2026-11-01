-- ======================================================================
-- Q10
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 10. Try to insert an enrollment for StudentID = 999. Explain the result.
--
-- NOTE: Needs the foreign key from Q8 to exist.
-- ======================================================================

USE sql_lab;

-- Explanation: Student has no StudentID 999, so the foreign key constraint stops the
-- insert. An enrollment must belong to an existing student.

-- The next statement is EXPECTED to fail with:
-- ERROR - Cannot add or update a child row: a foreign key constraint fails
INSERT INTO Enrollment VALUES (5,999,'DBMS');
