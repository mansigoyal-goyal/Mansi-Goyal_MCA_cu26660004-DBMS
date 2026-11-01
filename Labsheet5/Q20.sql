-- ============================================================
-- Q20. Highest Paid Employee
-- ============================================================
-- Find the highest-paid employee among matched employees and display name, department, and salary.

USE CollegeJoinDB;

-- What it does: Sorts matched employees by salary from highest to lowest and keeps only the first row with LIMIT 1.
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.Salary DESC
LIMIT 1;

-- Expected output:
-- +---------+------------+----------+
-- | EmpName | DeptName   | Salary   |
-- +---------+------------+----------+
-- | Sneha   | Management | 91000.00 |
-- +---------+------------+----------+
-- 1 row in set
--
-- Observation: Neha earns 80000 but is not matched, so Sneha (91000) is the top matched employee.
