-- ============================================================
-- Q12. Natural Join
-- ============================================================
-- Use NATURAL JOIN to display employee names, DeptID, and department names. Do not write an ON condition.

USE CollegeJoinDB;

-- What it does: NATURAL JOIN automatically joins on columns with the same name in both tables (here only DeptID), and shows that column once.
SELECT EmpName, DeptID, DeptName
FROM Employees
NATURAL JOIN Departments
ORDER BY EmpID;

-- Expected output:
-- +---------+--------+------------------+
-- | EmpName | DeptID | DeptName         |
-- +---------+--------+------------------+
-- | Aarav   |     10 | Computer Science |
-- | Priya   |     20 | Pharmacy         |
-- | Rahul   |     10 | Computer Science |
-- | Sneha   |     30 | Management       |
-- | Vikram  |     20 | Pharmacy         |
-- | Kabir   |     30 | Management       |
-- +---------+--------+------------------+
-- 6 rows in set
--
-- Observation: DeptID needs no table prefix because a natural join merges it into a single column.
