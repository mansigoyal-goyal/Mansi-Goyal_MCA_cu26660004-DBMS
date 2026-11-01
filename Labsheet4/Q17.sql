-- ======================================================================
-- Q17
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 17. Add a CHECK constraint to Student so that Age must be greater than 18. Test an invalid record.
--
-- NOTE: CHECK constraints are enforced from MySQL 8.0.16 onwards. Running the ALTER twice gives a duplicate constraint name error.
-- ======================================================================

USE sql_lab;

ALTER TABLE Student
ADD CONSTRAINT chk_student_age CHECK (Age > 18);

-- Test: age 17 breaks the rule, so the insert is rejected.

-- The next statement is EXPECTED to fail with:
-- ERROR - Check constraint 'chk_student_age' is violated.
INSERT INTO Student
VALUES (106,'Riya Das','riya@example.com',17,20,'2026-08-01');
