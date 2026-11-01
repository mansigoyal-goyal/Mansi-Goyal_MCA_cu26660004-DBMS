-- ============================================================
-- Q17. Employee Count
-- ============================================================
-- Use INNER JOIN, GROUP BY, and COUNT to show the number of employees in each matched department.

USE CollegeJoinDB;

-- What it does: GROUP BY makes one group per department and COUNT(*) counts the employees in each group.
SELECT d.DeptName, COUNT(*) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY d.DeptName;

-- Expected output:
-- +------------------+----------------+
-- | DeptName         | TotalEmployees |
-- +------------------+----------------+
-- | Computer Science |              2 |
-- | Management       |              2 |
-- | Pharmacy         |              2 |
-- +------------------+----------------+
-- 3 rows in set
--
-- Observation: Civil Engineering is absent: INNER JOIN drops departments with no employees.
