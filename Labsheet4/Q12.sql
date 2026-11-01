-- ======================================================================
-- Q12
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 12. Display enrollment details together with the student name using an INNER JOIN.
-- ======================================================================

USE sql_lab;

-- INNER JOIN returns only the enrollments whose StudentID matches a Student row.

SELECT e.EnrollmentID, s.Name, e.CourseName
FROM Enrollment e
INNER JOIN Student s ON e.StudentID = s.StudentID;
