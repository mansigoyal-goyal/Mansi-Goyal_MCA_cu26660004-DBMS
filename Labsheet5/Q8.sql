-- ============================================================
-- Q8. Theta Join – Greater Than
-- ============================================================
-- Use a Theta Join to display employees whose salary is greater than a salary grade's minimum salary.

USE CollegeJoinDB;

-- What it does: A Theta Join uses a comparison other than '='. Each employee is paired with every grade whose MinSalary is below the employee's salary, so one employee can appear several times.
SELECT e.EmpName, e.Salary, s.Grade, s.MinSalary
FROM Employees e
INNER JOIN SalaryGrades s ON e.Salary > s.MinSalary
ORDER BY e.EmpID, s.Grade;

-- Expected output:
-- +---------+----------+-------+-----------+
-- | EmpName | Salary   | Grade | MinSalary |
-- +---------+----------+-------+-----------+
-- | Aarav   | 65000.00 | G1    |      0.00 |
-- | Aarav   | 65000.00 | G2    |  50000.00 |
-- | Priya   | 72000.00 | G1    |      0.00 |
-- | Priya   | 72000.00 | G2    |  50000.00 |
-- | Priya   | 72000.00 | G3    |  70000.00 |
-- | Rahul   | 48000.00 | G1    |      0.00 |
-- | Sneha   | 91000.00 | G1    |      0.00 |
-- | Sneha   | 91000.00 | G2    |  50000.00 |
-- | Sneha   | 91000.00 | G3    |  70000.00 |
-- | Sneha   | 91000.00 | G4    |  90000.00 |
-- | Vikram  | 55000.00 | G1    |      0.00 |
-- | Vikram  | 55000.00 | G2    |  50000.00 |
-- | Neha    | 80000.00 | G1    |      0.00 |
-- | Neha    | 80000.00 | G2    |  50000.00 |
-- | Neha    | 80000.00 | G3    |  70000.00 |
-- | Kabir   | 43000.00 | G1    |      0.00 |
-- +---------+----------+-------+-----------+
-- 16 rows in set
--
-- Observation: 16 rows: employees repeat because they exceed the minimum of several grades. SalaryGrades has no DeptID, so Neha is included here.
