-- ============================================================
-- Q16. DISTINCT Departments
-- ============================================================
-- Display distinct department names that have at least one matching employee.

USE CollegeJoinDB;

-- What it does: DISTINCT removes duplicate department names that appear once per employee.
SELECT DISTINCT d.DeptName
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
ORDER BY d.DeptName;

-- Expected output:
-- +------------------+
-- | DeptName         |
-- +------------------+
-- | Computer Science |
-- | Management       |
-- | Pharmacy         |
-- +------------------+
-- 3 rows in set
--
-- Observation: Civil Engineering is not listed because it has no employees.
