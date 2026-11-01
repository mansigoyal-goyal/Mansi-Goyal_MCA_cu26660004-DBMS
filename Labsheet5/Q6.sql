-- ============================================================
-- Q6. Equi Join with Multiple Columns
-- ============================================================
-- Display employee name, employee city, department name, and department location using an equality-based join.

USE CollegeJoinDB;

-- What it does: Equality join that picks columns from both tables: EmpName and City from Employees, DeptName and Location from Departments.
SELECT e.EmpName, e.City, d.DeptName, d.Location
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Expected output:
-- +---------+--------+------------------+----------+
-- | EmpName | City   | DeptName         | Location |
-- +---------+--------+------------------+----------+
-- | Aarav   | Delhi  | Computer Science | Block A  |
-- | Priya   | Mumbai | Pharmacy         | Block B  |
-- | Rahul   | Delhi  | Computer Science | Block A  |
-- | Sneha   | Pune   | Management       | Block C  |
-- | Vikram  | Jaipur | Pharmacy         | Block B  |
-- | Kabir   | Pune   | Management       | Block C  |
-- +---------+--------+------------------+----------+
-- 6 rows in set
--
-- Observation: City is where the employee lives; Location is where the department is.
