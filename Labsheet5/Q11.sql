-- ============================================================
-- Q11. Theta Join – Greater Than or Equal
-- ============================================================
-- Display employee name, salary, and grade where employee salary is >= the grade minimum.

USE CollegeJoinDB;

-- What it does: Same idea as Q8, but '>=' also accepts a salary exactly equal to the minimum.
SELECT e.EmpName, e.Salary, s.Grade
FROM Employees e
INNER JOIN SalaryGrades s ON e.Salary >= s.MinSalary
ORDER BY e.EmpID, s.Grade;

-- Expected output:
-- +---------+----------+-------+
-- | EmpName | Salary   | Grade |
-- +---------+----------+-------+
-- | Aarav   | 65000.00 | G1    |
-- | Aarav   | 65000.00 | G2    |
-- | Priya   | 72000.00 | G1    |
-- | Priya   | 72000.00 | G2    |
-- | Priya   | 72000.00 | G3    |
-- | Rahul   | 48000.00 | G1    |
-- | Sneha   | 91000.00 | G1    |
-- | Sneha   | 91000.00 | G2    |
-- | Sneha   | 91000.00 | G3    |
-- | Sneha   | 91000.00 | G4    |
-- | Vikram  | 55000.00 | G1    |
-- | Vikram  | 55000.00 | G2    |
-- | Neha    | 80000.00 | G1    |
-- | Neha    | 80000.00 | G2    |
-- | Neha    | 80000.00 | G3    |
-- | Kabir   | 43000.00 | G1    |
-- +---------+----------+-------+
-- 16 rows in set
--
-- Observation: Same 16 rows as Q8 because no salary in the data equals a grade minimum exactly.
