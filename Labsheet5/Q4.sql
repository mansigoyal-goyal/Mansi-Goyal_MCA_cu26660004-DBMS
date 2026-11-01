-- ============================================================
-- Q4. Salary Filter
-- ============================================================
-- Display matched employees whose salary is greater than 60000.

USE CollegeJoinDB;

-- What it does: Joins the tables and filters with Salary > 60000.
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.Salary > 60000
ORDER BY e.EmpID;

-- Expected output:
-- +---------+------------------+----------+
-- | EmpName | DeptName         | Salary   |
-- +---------+------------------+----------+
-- | Aarav   | Computer Science | 65000.00 |
-- | Priya   | Pharmacy         | 72000.00 |
-- | Sneha   | Management       | 91000.00 |
-- +---------+------------------+----------+
-- 3 rows in set
--
-- Observation: Neha earns 80000 but is not matched with any department, so she is not shown.
