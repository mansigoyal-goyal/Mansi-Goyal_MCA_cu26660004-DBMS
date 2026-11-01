-- ======================================================================
-- Q52
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 52. Create Members with member_id as PRIMARY KEY, name as NOT NULL, email as UNIQUE and phone_number.
-- ======================================================================

USE sql_lab;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Members;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);
