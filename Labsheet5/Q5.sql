-- ============================================================
-- Q5. Equi Join
-- ============================================================
-- Perform an Equi Join between Employees and Departments using DeptID = DeptID.

USE CollegeJoinDB;

-- What it does: An Equi Join is an inner join whose condition uses '='. SELECT * shows both DeptID columns, and their values are always equal.
SELECT *
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+--------+----------+--------+--------+------------------+----------+
-- | EmpID | EmpName | DeptID | Salary   | City   | DeptID | DeptName         | Location |
-- +-------+---------+--------+----------+--------+--------+------------------+----------+
-- |   101 | Aarav   |     10 | 65000.00 | Delhi  |     10 | Computer Science | Block A  |
-- |   102 | Priya   |     20 | 72000.00 | Mumbai |     20 | Pharmacy         | Block B  |
-- |   103 | Rahul   |     10 | 48000.00 | Delhi  |     10 | Computer Science | Block A  |
-- |   104 | Sneha   |     30 | 91000.00 | Pune   |     30 | Management       | Block C  |
-- |   105 | Vikram  |     20 | 55000.00 | Jaipur |     20 | Pharmacy         | Block B  |
-- |   107 | Kabir   |     30 | 43000.00 | Pune   |     30 | Management       | Block C  |
-- +-------+---------+--------+----------+--------+--------+------------------+----------+
-- 6 rows in set
--
-- Observation: Both DeptID columns appear and always match in every row.
