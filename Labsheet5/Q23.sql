-- ============================================================
-- Q23. Matched Rows Observation
-- ============================================================
-- Use INNER JOIN to display all matched employees. Observe which employee is excluded because no department has DeptID 50.

USE CollegeJoinDB;

-- What it does: Lists every employee that has a department. A second, optional check query uses LEFT JOIN to reveal the excluded employee.
-- Main query: only matched employees
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Optional check: employees with no matching department
SELECT e.EmpID, e.EmpName, e.DeptID
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

-- Expected output:
-- +-------+---------+--------+------------------+
-- | EmpID | EmpName | DeptID | DeptName         |
-- +-------+---------+--------+------------------+
-- |   101 | Aarav   |     10 | Computer Science |
-- |   102 | Priya   |     20 | Pharmacy         |
-- |   103 | Rahul   |     10 | Computer Science |
-- |   104 | Sneha   |     30 | Management       |
-- |   105 | Vikram  |     20 | Pharmacy         |
-- |   107 | Kabir   |     30 | Management       |
-- +-------+---------+--------+------------------+
-- 6 rows in set
--
-- (Optional check query)
-- +-------+---------+--------+
-- | EmpID | EmpName | DeptID |
-- +-------+---------+--------+
-- |   106 | Neha    |     50 |
-- +-------+---------+--------+
-- 1 row in set
--
-- Observation: 6 of 7 employees appear. Employee 106 (Neha, DeptID 50) is excluded.
