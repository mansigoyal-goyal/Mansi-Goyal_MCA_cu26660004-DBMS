-- ======================================================================
-- Q1
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 1. Identify the primary key of Department and explain why DeptID is suitable.
-- ======================================================================

USE sql_lab;

-- Answer: DeptID is the primary key of Department.
-- It uniquely identifies each department, cannot be NULL (because it is a primary key),
-- and its values never repeat. DESCRIBE shows 'PRI' in the Key column for DeptID.

DESCRIBE Department;
