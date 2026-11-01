-- ============================================================
-- Q3. Pharmacy Employees
-- ============================================================
-- Use INNER JOIN and WHERE to display employees belonging to the Pharmacy department.

USE CollegeJoinDB;

-- What it does: JOIN first combines the tables, then WHERE keeps only the Pharmacy rows.
SELECT e.EmpID, e.EmpName, e.Salary, e.City, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Pharmacy'
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+----------+--------+----------+
-- | EmpID | EmpName | Salary   | City   | DeptName |
-- +-------+---------+----------+--------+----------+
-- |   102 | Priya   | 72000.00 | Mumbai | Pharmacy |
-- |   105 | Vikram  | 55000.00 | Jaipur | Pharmacy |
-- +-------+---------+----------+--------+----------+
-- 2 rows in set
