-- ======================================================================
-- Q15
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 15. Modify Student so that Email must be UNIQUE. Try inserting a duplicate email.
--
-- NOTE: Running the ALTER twice gives 'Duplicate key name'. To start over, re-run database_setup.sql.
-- ======================================================================

USE sql_lab;

ALTER TABLE Student
ADD CONSTRAINT uq_student_email UNIQUE (Email);

-- What happens: amit@example.com already exists, so the duplicate is rejected.

-- The next statement is EXPECTED to fail with:
-- ERROR - Duplicate entry 'amit@example.com' for key 'Student.uq_student_email'
INSERT INTO Student
VALUES (106,'Riya Das','amit@example.com',21,20,'2026-08-01');
