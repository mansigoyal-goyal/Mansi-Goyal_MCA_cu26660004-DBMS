-- ============================================================
-- Q1. Basic Inner Join
-- ============================================================
-- Display employee names, department names, and department locations for employees with matching departments.

USE CollegeJoinDB;

-- What it does: INNER JOIN keeps only employees whose DeptID also exists in Departments.
SELECT e.EmpName, d.DeptName, d.Location
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Expected output:
-- +---------+------------------+----------+
-- | EmpName | DeptName         | Location |
-- +---------+------------------+----------+
-- | Aarav   | Computer Science | Block A  |
-- | Priya   | Pharmacy         | Block B  |
-- | Rahul   | Computer Science | Block A  |
-- | Sneha   | Management       | Block C  |
-- | Vikram  | Pharmacy         | Block B  |
-- | Kabir   | Management       | Block C  |
-- +---------+------------------+----------+
-- 6 rows in set
--
-- Observation: Neha (DeptID 50) is missing because no department has DeptID 50.
