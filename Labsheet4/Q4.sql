-- ======================================================================
-- Q4
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 4. Try to insert another student with StudentID = 101. What happens?
-- ======================================================================

USE sql_lab;

-- What happens: MySQL rejects the row because StudentID 101 already exists and a
-- PRIMARY KEY value must be unique. Nothing is inserted.

-- The next statement is EXPECTED to fail with:
-- ERROR - Duplicate entry '101' for key 'Student.PRIMARY'
INSERT INTO Student VALUES (101,'Karan Shah','karan@example.com',21,20,'2026-08-01');
