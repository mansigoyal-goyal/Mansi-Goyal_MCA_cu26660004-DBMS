-- ======================================================================
-- Q5
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 5. Create Enrollment with EnrollmentID as its PRIMARY KEY and insert the four dummy enrollment records.
-- ======================================================================

USE sql_lab;

-- The first lines drop any old copy of the table so this question can be re-run safely.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Enrollment;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(100)
);

INSERT INTO Enrollment VALUES
(1,101,'DBMS'), (2,102,'Operating Systems'),
(3,103,'Pharmacology'), (4,104,'Python');

SELECT * FROM Enrollment;
