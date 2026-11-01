-- ============================================================
-- Q22. Multiple WHERE Conditions
-- ============================================================
-- Display employees from Delhi or Pune whose salary is at least 50000, with department names.

USE CollegeJoinDB;

-- What it does: Combines IN (city) with AND (salary) in WHERE.
SELECT e.EmpName, e.City, e.Salary, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.City IN ('Delhi', 'Pune') AND e.Salary >= 50000
ORDER BY e.EmpID;

-- Expected output:
-- +---------+-------+----------+------------------+
-- | EmpName | City  | Salary   | DeptName         |
-- +---------+-------+----------+------------------+
-- | Aarav   | Delhi | 65000.00 | Computer Science |
-- | Sneha   | Pune  | 91000.00 | Management       |
-- +---------+-------+----------+------------------+
-- 2 rows in set
--
-- Observation: Rahul (48000) and Kabir (43000) are below 50000.
