-- ======================================================================
-- Q20
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 20. Create a Faculty table where Designation defaults to 'Lecturer'. Insert a faculty record without Designation.
-- ======================================================================

USE sql_lab;

DROP TABLE IF EXISTS Faculty;

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) DEFAULT 'Lecturer'
);

INSERT INTO Faculty (FacultyID, FacultyName)
VALUES (1,'Dr. Meera Sharma');

SELECT * FROM Faculty;
