-- ======================================================================
-- Q6
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 6. Try to insert another enrollment with EnrollmentID = 1. What happens?
-- ======================================================================

USE sql_lab;

-- What happens: MySQL rejects the row because EnrollmentID 1 already exists
-- (duplicate PRIMARY KEY value). Nothing is inserted.

-- The next statement is EXPECTED to fail with:
-- ERROR - Duplicate entry '1' for key 'Enrollment.PRIMARY'
INSERT INTO Enrollment VALUES (1,105,'Data Mining');
