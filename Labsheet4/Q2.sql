-- ======================================================================
-- Q2
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 2. Create Department so that DeptID is a PRIMARY KEY. Insert the four dummy department records.
-- ======================================================================

USE sql_lab;

-- The first lines drop any old copy of the table so this question can be re-run safely.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Department;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

INSERT INTO Department VALUES
(10,'Computer Science'), (20,'Information Technology'),
(30,'Pharmacy'), (40,'Management');

SELECT * FROM Department;
