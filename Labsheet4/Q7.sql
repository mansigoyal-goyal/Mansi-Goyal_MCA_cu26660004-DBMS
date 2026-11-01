-- ======================================================================
-- Q7
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 7. Add a FOREIGN KEY from Student(DeptID) to Department(DeptID).
--
-- NOTE: Run after setup (or after Q2 and Q3). Running it twice gives 'Duplicate foreign key constraint name'. To start over, re-run database_setup.sql.
-- ======================================================================

USE sql_lab;

-- Student is the child table and Department is the parent table.

ALTER TABLE Student
ADD CONSTRAINT fk_student_department FOREIGN KEY (DeptID) REFERENCES Department(DeptID);
