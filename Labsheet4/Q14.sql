-- ======================================================================
-- Q14
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 14. Try inserting a Student without providing Name. What happens?
-- ======================================================================

USE sql_lab;

-- What happens: Name is NOT NULL and has no default value, so MySQL rejects the row.
-- (The PDF shows "Column 'Name' cannot be null"; MySQL 8.0 words it slightly differently
-- when a column is left out - see outputs/expected_outputs.md.)

-- The next statement is EXPECTED to fail with:
-- ERROR - Field 'Name' doesn't have a default value
INSERT INTO Student (StudentID, Email, Age, DeptID) VALUES
(106,'riya@example.com',21,20);
