-- ============================================================
-- Q21. IN Condition
-- ============================================================
-- Display employees working in either Computer Science or Pharmacy.

USE CollegeJoinDB;

-- What it does: IN is a shorter way to write DeptName = 'Computer Science' OR DeptName = 'Pharmacy'.
SELECT e.EmpID, e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName IN ('Computer Science', 'Pharmacy')
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+------------------+----------+
-- | EmpID | EmpName | DeptName         | Salary   |
-- +-------+---------+------------------+----------+
-- |   101 | Aarav   | Computer Science | 65000.00 |
-- |   102 | Priya   | Pharmacy         | 72000.00 |
-- |   103 | Rahul   | Computer Science | 48000.00 |
-- |   105 | Vikram  | Pharmacy         | 55000.00 |
-- +-------+---------+------------------+----------+
-- 4 rows in set
