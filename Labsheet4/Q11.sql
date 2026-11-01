-- ======================================================================
-- Q11
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 11. Display students together with their department names using an INNER JOIN.
-- ======================================================================

USE sql_lab;

-- INNER JOIN returns only the rows where Student.DeptID matches Department.DeptID.

SELECT s.StudentID, s.Name, d.DeptName
FROM Student s
INNER JOIN Department d ON s.DeptID = d.DeptID;
