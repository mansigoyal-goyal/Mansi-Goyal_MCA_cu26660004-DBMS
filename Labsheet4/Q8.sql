-- ======================================================================
-- Q8
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 8. Add a FOREIGN KEY from Enrollment(StudentID) to Student(StudentID).
--
-- NOTE: Run after setup (or after Q3 and Q5). Running it twice gives 'Duplicate foreign key constraint name'.
-- ======================================================================

USE sql_lab;

-- Enrollment is the child table and Student is the parent table.

ALTER TABLE Enrollment
ADD CONSTRAINT fk_enrollment_student FOREIGN KEY (StudentID) REFERENCES Student(StudentID);
