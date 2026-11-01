-- ======================================================================
-- Q19
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 19. Add JoiningDate to Student with the current date as its DEFAULT. Insert a student without specifying JoiningDate.
--
-- NOTE: Running it twice gives 'Duplicate column name' / duplicate key errors. To start over, re-run database_setup.sql.
-- ======================================================================

USE sql_lab;

-- Student already has a JoiningDate column, so (as in the PDF's solution) the new column
-- is named JoiningDate2. DEFAULT (CURRENT_DATE) needs MySQL 8.0.13 or later.

ALTER TABLE Student
ADD COLUMN JoiningDate2 DATE DEFAULT (CURRENT_DATE);

INSERT INTO Student (StudentID, Name, Email, Age, DeptID)
VALUES (106,'Riya Das','riya@example.com',21,20);

SELECT * FROM Student;

-- In the new row, JoiningDate2 holds the date on which you ran the insert.
