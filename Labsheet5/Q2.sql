-- ============================================================
-- Q2. Employee and Department IDs
-- ============================================================
-- Use INNER JOIN to display EmpID, EmpName, DeptID, and DeptName.

USE CollegeJoinDB;

-- What it does: Shows the employee ID and name along with the DeptID and its name. e.DeptID is used because DeptID exists in both tables.
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

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
