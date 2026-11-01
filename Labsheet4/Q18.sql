-- ======================================================================
-- Q18
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 18. Create a Course table where Credits must be between 1 and 6. Test an invalid record.
-- ======================================================================

USE sql_lab;

DROP TABLE IF EXISTS Course;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT CHECK (Credits BETWEEN 1 AND 6)
);

-- Test: 8 credits is outside 1-6, so the insert is rejected.

-- The next statement is EXPECTED to fail with:
-- ERROR - Check constraint 'Course_chk_1' is violated.
INSERT INTO Course VALUES (1,'DBMS',8);
