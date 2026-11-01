-- ============================================================
-- Q25. Final Challenge
-- ============================================================
-- Use an equality-based INNER JOIN to find departments whose total employee salary is greater than 100000. Display department name and total salary.

USE CollegeJoinDB;

-- What it does: SUM() adds salaries per department; HAVING keeps groups whose total is above 100000.
SELECT d.DeptName, SUM(e.Salary) AS TotalSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
HAVING SUM(e.Salary) > 100000
ORDER BY TotalSalary DESC;

-- Expected output:
-- +------------------+-------------+
-- | DeptName         | TotalSalary |
-- +------------------+-------------+
-- | Management       |   134000.00 |
-- | Pharmacy         |   127000.00 |
-- | Computer Science |   113000.00 |
-- +------------------+-------------+
-- 3 rows in set
--
-- Observation: All three departments with employees pass the 100000 limit with the given data.
