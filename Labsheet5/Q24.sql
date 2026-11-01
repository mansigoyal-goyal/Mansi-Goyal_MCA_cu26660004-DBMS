-- ============================================================
-- Q24. Natural Join + GROUP BY
-- ============================================================
-- Using NATURAL JOIN, count employees in each department.

USE CollegeJoinDB;

-- What it does: Natural join on DeptID, then GROUP BY DeptName with COUNT(*).
SELECT DeptName, COUNT(*) AS TotalEmployees
FROM Employees
NATURAL JOIN Departments
GROUP BY DeptName
ORDER BY DeptName;

-- Expected output:
-- +------------------+----------------+
-- | DeptName         | TotalEmployees |
-- +------------------+----------------+
-- | Computer Science |              2 |
-- | Management       |              2 |
-- | Pharmacy         |              2 |
-- +------------------+----------------+
-- 3 rows in set
