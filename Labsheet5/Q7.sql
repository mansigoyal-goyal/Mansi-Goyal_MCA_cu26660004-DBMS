-- ============================================================
-- Q7. Computer Science
-- ============================================================
-- Find all employees belonging to Computer Science using an equality-based INNER JOIN.

USE CollegeJoinDB;

-- What it does: Equality join followed by a filter on DeptName.
SELECT e.EmpID, e.EmpName, e.Salary, e.City
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Computer Science'
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+----------+-------+
-- | EmpID | EmpName | Salary   | City  |
-- +-------+---------+----------+-------+
-- |   101 | Aarav   | 65000.00 | Delhi |
-- |   103 | Rahul   | 48000.00 | Delhi |
-- +-------+---------+----------+-------+
-- 2 rows in set
