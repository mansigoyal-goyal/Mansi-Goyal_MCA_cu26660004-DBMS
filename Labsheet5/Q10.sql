-- ============================================================
-- Q10. Theta Join – Less Than
-- ============================================================
-- Display employee names and salary grades where employee salary is less than the grade maximum salary.

USE CollegeJoinDB;

-- What it does: Pairs each employee with every grade whose MaxSalary is higher than the employee's salary.
SELECT e.EmpName, e.Salary, s.Grade, s.MaxSalary
FROM Employees e
INNER JOIN SalaryGrades s ON e.Salary < s.MaxSalary
ORDER BY e.EmpID, s.Grade;

-- Expected output:
-- +---------+----------+-------+-----------+
-- | EmpName | Salary   | Grade | MaxSalary |
-- +---------+----------+-------+-----------+
-- | Aarav   | 65000.00 | G2    |  69999.00 |
-- | Aarav   | 65000.00 | G3    |  89999.00 |
-- | Aarav   | 65000.00 | G4    | 120000.00 |
-- | Priya   | 72000.00 | G3    |  89999.00 |
-- | Priya   | 72000.00 | G4    | 120000.00 |
-- | Rahul   | 48000.00 | G1    |  49999.00 |
-- | Rahul   | 48000.00 | G2    |  69999.00 |
-- | Rahul   | 48000.00 | G3    |  89999.00 |
-- | Rahul   | 48000.00 | G4    | 120000.00 |
-- | Sneha   | 91000.00 | G4    | 120000.00 |
-- | Vikram  | 55000.00 | G2    |  69999.00 |
-- | Vikram  | 55000.00 | G3    |  89999.00 |
-- | Vikram  | 55000.00 | G4    | 120000.00 |
-- | Neha    | 80000.00 | G3    |  89999.00 |
-- | Neha    | 80000.00 | G4    | 120000.00 |
-- | Kabir   | 43000.00 | G1    |  49999.00 |
-- | Kabir   | 43000.00 | G2    |  69999.00 |
-- | Kabir   | 43000.00 | G3    |  89999.00 |
-- | Kabir   | 43000.00 | G4    | 120000.00 |
-- +---------+----------+-------+-----------+
-- 19 rows in set
--
-- Observation: 19 rows. Employees with low salaries match more grades.
