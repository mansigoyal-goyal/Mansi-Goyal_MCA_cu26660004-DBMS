-- ======================================================================
-- Q13
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 13. Create a Department table where DeptName cannot be NULL. Try inserting a department without DeptName. What happens?
-- ======================================================================

USE sql_lab;

-- The PDF's solution uses a table called Department2 (Department already exists).

DROP TABLE IF EXISTS Department2;

CREATE TABLE Department2 (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- What happens: NOT NULL does not allow a NULL DeptName, so the insert fails.

-- The next statement is EXPECTED to fail with:
-- ERROR - Column 'DeptName' cannot be null
INSERT INTO Department2 VALUES (50,NULL);
