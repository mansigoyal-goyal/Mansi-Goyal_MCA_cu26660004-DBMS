-- ============================================================
-- Q18. Average Salary
-- ============================================================
-- Use INNER JOIN and GROUP BY to calculate average salary for each matched department.

USE CollegeJoinDB;

-- What it does: AVG() works on each group; ROUND(...,2) limits the result to 2 decimals.
SELECT d.DeptName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY d.DeptName;

-- Expected output:
-- +------------------+-----------+
-- | DeptName         | AvgSalary |
-- +------------------+-----------+
-- | Computer Science |  56500.00 |
-- | Management       |  67000.00 |
-- | Pharmacy         |  63500.00 |
-- +------------------+-----------+
-- 3 rows in set
