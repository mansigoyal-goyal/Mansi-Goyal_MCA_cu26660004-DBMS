-- ============================================================
-- Q13. Natural Join with Filter
-- ============================================================
-- Using NATURAL JOIN, display employees belonging to the department located in Block B.

USE CollegeJoinDB;

-- What it does: Natural join plus WHERE on Location. Only Pharmacy is in Block B.
SELECT EmpID, EmpName, DeptName, Location
FROM Employees
NATURAL JOIN Departments
WHERE Location = 'Block B'
ORDER BY EmpID;

-- Expected output:
-- +-------+---------+----------+----------+
-- | EmpID | EmpName | DeptName | Location |
-- +-------+---------+----------+----------+
-- |   102 | Priya   | Pharmacy | Block B  |
-- |   105 | Vikram  | Pharmacy | Block B  |
-- +-------+---------+----------+----------+
-- 2 rows in set
