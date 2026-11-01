-- ============================================================
-- Q19. HAVING
-- ============================================================
-- Show departments whose average employee salary is greater than 60000.

USE CollegeJoinDB;

-- What it does: HAVING filters groups after the average is calculated. WHERE cannot do this because it runs before grouping.
SELECT d.DeptName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
HAVING AVG(e.Salary) > 60000
ORDER BY AvgSalary DESC;

-- Expected output:
-- +------------+-----------+
-- | DeptName   | AvgSalary |
-- +------------+-----------+
-- | Management |  67000.00 |
-- | Pharmacy   |  63500.00 |
-- +------------+-----------+
-- 2 rows in set
--
-- Observation: Computer Science (56500.00) is filtered out.
