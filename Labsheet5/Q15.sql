-- ============================================================
-- Q15. Inner Join + ORDER BY
-- ============================================================
-- Display matched employee name, department, and salary sorted from highest salary to lowest.

USE CollegeJoinDB;

-- What it does: ORDER BY ... DESC sorts from the highest value to the lowest.
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.Salary DESC;

-- Expected output:
-- +---------+------------------+----------+
-- | EmpName | DeptName         | Salary   |
-- +---------+------------------+----------+
-- | Sneha   | Management       | 91000.00 |
-- | Priya   | Pharmacy         | 72000.00 |
-- | Aarav   | Computer Science | 65000.00 |
-- | Vikram  | Pharmacy         | 55000.00 |
-- | Rahul   | Computer Science | 48000.00 |
-- | Kabir   | Management       | 43000.00 |
-- +---------+------------------+----------+
-- 6 rows in set
