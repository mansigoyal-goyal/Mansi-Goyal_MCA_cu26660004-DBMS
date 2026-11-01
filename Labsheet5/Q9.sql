-- ============================================================
-- Q9. Theta Join – Salary Range
-- ============================================================
-- Assign each employee to the correct salary grade using >= and <= in the join condition.

USE CollegeJoinDB;

-- What it does: The BETWEEN-style condition (>= MinSalary and <= MaxSalary) matches each employee to exactly one grade.
SELECT e.EmpName, e.Salary, s.Grade, s.MinSalary, s.MaxSalary
FROM Employees e
INNER JOIN SalaryGrades s
        ON e.Salary >= s.MinSalary AND e.Salary <= s.MaxSalary
ORDER BY e.EmpID;

-- Expected output:
-- +---------+----------+-------+-----------+-----------+
-- | EmpName | Salary   | Grade | MinSalary | MaxSalary |
-- +---------+----------+-------+-----------+-----------+
-- | Aarav   | 65000.00 | G2    |  50000.00 |  69999.00 |
-- | Priya   | 72000.00 | G3    |  70000.00 |  89999.00 |
-- | Rahul   | 48000.00 | G1    |      0.00 |  49999.00 |
-- | Sneha   | 91000.00 | G4    |  90000.00 | 120000.00 |
-- | Vikram  | 55000.00 | G2    |  50000.00 |  69999.00 |
-- | Neha    | 80000.00 | G3    |  70000.00 |  89999.00 |
-- | Kabir   | 43000.00 | G1    |      0.00 |  49999.00 |
-- +---------+----------+-------+-----------+-----------+
-- 7 rows in set
--
-- Observation: Each of the 7 employees gets exactly one grade.
