-- ============================================================
-- Q14. Natural Join with Salary
-- ============================================================
-- Using NATURAL JOIN, display employee name, department name, and salary for salaries >= 70000.

USE CollegeJoinDB;

-- What it does: Natural join, then WHERE keeps salaries of 70000 or more.
SELECT EmpName, DeptName, Salary
FROM Employees
NATURAL JOIN Departments
WHERE Salary >= 70000
ORDER BY EmpID;

-- Expected output:
-- +---------+------------+----------+
-- | EmpName | DeptName   | Salary   |
-- +---------+------------+----------+
-- | Priya   | Pharmacy   | 72000.00 |
-- | Sneha   | Management | 91000.00 |
-- +---------+------------+----------+
-- 2 rows in set
--
-- Observation: Neha (80000) is excluded because her department does not exist.
