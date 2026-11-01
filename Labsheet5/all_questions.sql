-- Database Technologies Lab Sheet 5 (MCA105P) - All 25 questions
-- Run database_setup.sql ONCE before this file.

USE CollegeJoinDB;

-- ============================================================
-- Q1. Basic Inner Join
-- ============================================================
-- Display employee names, department names, and department locations for employees with matching departments.

-- What it does: INNER JOIN keeps only employees whose DeptID also exists in Departments.
SELECT e.EmpName, d.DeptName, d.Location
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Expected output:
-- +---------+------------------+----------+
-- | EmpName | DeptName         | Location |
-- +---------+------------------+----------+
-- | Aarav   | Computer Science | Block A  |
-- | Priya   | Pharmacy         | Block B  |
-- | Rahul   | Computer Science | Block A  |
-- | Sneha   | Management       | Block C  |
-- | Vikram  | Pharmacy         | Block B  |
-- | Kabir   | Management       | Block C  |
-- +---------+------------------+----------+
-- 6 rows in set
--
-- Observation: Neha (DeptID 50) is missing because no department has DeptID 50.

-- ============================================================
-- Q2. Employee and Department IDs
-- ============================================================
-- Use INNER JOIN to display EmpID, EmpName, DeptID, and DeptName.

-- What it does: Shows the employee ID and name along with the DeptID and its name. e.DeptID is used because DeptID exists in both tables.
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+--------+------------------+
-- | EmpID | EmpName | DeptID | DeptName         |
-- +-------+---------+--------+------------------+
-- |   101 | Aarav   |     10 | Computer Science |
-- |   102 | Priya   |     20 | Pharmacy         |
-- |   103 | Rahul   |     10 | Computer Science |
-- |   104 | Sneha   |     30 | Management       |
-- |   105 | Vikram  |     20 | Pharmacy         |
-- |   107 | Kabir   |     30 | Management       |
-- +-------+---------+--------+------------------+
-- 6 rows in set

-- ============================================================
-- Q3. Pharmacy Employees
-- ============================================================
-- Use INNER JOIN and WHERE to display employees belonging to the Pharmacy department.

-- What it does: JOIN first combines the tables, then WHERE keeps only the Pharmacy rows.
SELECT e.EmpID, e.EmpName, e.Salary, e.City, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Pharmacy'
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+----------+--------+----------+
-- | EmpID | EmpName | Salary   | City   | DeptName |
-- +-------+---------+----------+--------+----------+
-- |   102 | Priya   | 72000.00 | Mumbai | Pharmacy |
-- |   105 | Vikram  | 55000.00 | Jaipur | Pharmacy |
-- +-------+---------+----------+--------+----------+
-- 2 rows in set

-- ============================================================
-- Q4. Salary Filter
-- ============================================================
-- Display matched employees whose salary is greater than 60000.

-- What it does: Joins the tables and filters with Salary > 60000.
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.Salary > 60000
ORDER BY e.EmpID;

-- Expected output:
-- +---------+------------------+----------+
-- | EmpName | DeptName         | Salary   |
-- +---------+------------------+----------+
-- | Aarav   | Computer Science | 65000.00 |
-- | Priya   | Pharmacy         | 72000.00 |
-- | Sneha   | Management       | 91000.00 |
-- +---------+------------------+----------+
-- 3 rows in set
--
-- Observation: Neha earns 80000 but is not matched with any department, so she is not shown.

-- ============================================================
-- Q5. Equi Join
-- ============================================================
-- Perform an Equi Join between Employees and Departments using DeptID = DeptID.

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

-- ============================================================
-- Q6. Equi Join with Multiple Columns
-- ============================================================
-- Display employee name, employee city, department name, and department location using an equality-based join.

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

-- ============================================================
-- Q7. Computer Science
-- ============================================================
-- Find all employees belonging to Computer Science using an equality-based INNER JOIN.

-- What it does: Equality join followed by a filter on DeptName.
SELECT e.EmpID, e.EmpName, e.Salary, e.City
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Computer Science'
ORDER BY e.EmpID;

-- Expected output:
-- +-------+---------+----------+-------+
-- | EmpID | EmpName | Salary   | City  |
-- +-------+---------+----------+-------+
-- |   101 | Aarav   | 65000.00 | Delhi |
-- |   103 | Rahul   | 48000.00 | Delhi |
-- +-------+---------+----------+-------+
-- 2 rows in set

-- ============================================================
-- Q8. Theta Join – Greater Than
-- ============================================================
-- Use a Theta Join to display employees whose salary is greater than a salary grade's minimum salary.

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

-- ============================================================
-- Q9. Theta Join – Salary Range
-- ============================================================
-- Assign each employee to the correct salary grade using >= and <= in the join condition.

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

-- ============================================================
-- Q10. Theta Join – Less Than
-- ============================================================
-- Display employee names and salary grades where employee salary is less than the grade maximum salary.

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

-- ============================================================
-- Q11. Theta Join – Greater Than or Equal
-- ============================================================
-- Display employee name, salary, and grade where employee salary is >= the grade minimum.

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

-- ============================================================
-- Q12. Natural Join
-- ============================================================
-- Use NATURAL JOIN to display employee names, DeptID, and department names. Do not write an ON condition.

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

-- ============================================================
-- Q13. Natural Join with Filter
-- ============================================================
-- Using NATURAL JOIN, display employees belonging to the department located in Block B.

-- What it does: Natural join plus WHERE on Location. Only Pharmacy is in Block B.
SELECT EmpID, EmpName, DeptName, Location
FROM Employees
NATURAL JOIN Departments
WHERE Location = 'Block B'
ORDER BY EmpID;

-- Expected output:
-- +-------+---------+----------+----------+
-- | EmpID | EmpName | DeptName | Location |
-- +-------+---------+----------+----------+
-- |   102 | Priya   | Pharmacy | Block B  |
-- |   105 | Vikram  | Pharmacy | Block B  |
-- +-------+---------+----------+----------+
-- 2 rows in set

-- ============================================================
-- Q14. Natural Join with Salary
-- ============================================================
-- Using NATURAL JOIN, display employee name, department name, and salary for salaries >= 70000.

-- What it does: Natural join, then WHERE keeps salaries of 70000 or more.
SELECT EmpName, DeptName, Salary
FROM Employees
NATURAL JOIN Departments
WHERE Salary >= 70000
ORDER BY EmpID;

-- Expected output:
-- +---------+------------+----------+
-- | EmpName | DeptName   | Salary   |
-- +---------+------------+----------+
-- | Priya   | Pharmacy   | 72000.00 |
-- | Sneha   | Management | 91000.00 |
-- +---------+------------+----------+
-- 2 rows in set
--
-- Observation: Neha (80000) is excluded because her department does not exist.

-- ============================================================
-- Q15. Inner Join + ORDER BY
-- ============================================================
-- Display matched employee name, department, and salary sorted from highest salary to lowest.

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

-- ============================================================
-- Q16. DISTINCT Departments
-- ============================================================
-- Display distinct department names that have at least one matching employee.

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

-- ============================================================
-- Q17. Employee Count
-- ============================================================
-- Use INNER JOIN, GROUP BY, and COUNT to show the number of employees in each matched department.

-- What it does: GROUP BY makes one group per department and COUNT(*) counts the employees in each group.
SELECT d.DeptName, COUNT(*) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY d.DeptName;

-- Expected output:
-- +------------------+----------------+
-- | DeptName         | TotalEmployees |
-- +------------------+----------------+
-- | Computer Science |              2 |
-- | Management       |              2 |
-- | Pharmacy         |              2 |
-- +------------------+----------------+
-- 3 rows in set
--
-- Observation: Civil Engineering is absent: INNER JOIN drops departments with no employees.

-- ============================================================
-- Q18. Average Salary
-- ============================================================
-- Use INNER JOIN and GROUP BY to calculate average salary for each matched department.

-- What it does: AVG() works on each group; ROUND(...,2) limits the result to 2 decimals.
SELECT d.DeptName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY d.DeptName;

-- Expected output:
-- +------------------+-----------+
-- | DeptName         | AvgSalary |
-- +------------------+-----------+
-- | Computer Science |  56500.00 |
-- | Management       |  67000.00 |
-- | Pharmacy         |  63500.00 |
-- +------------------+-----------+
-- 3 rows in set

-- ============================================================
-- Q19. HAVING
-- ============================================================
-- Show departments whose average employee salary is greater than 60000.

-- What it does: HAVING filters groups after the average is calculated. WHERE cannot do this because it runs before grouping.
SELECT d.DeptName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
HAVING AVG(e.Salary) > 60000
ORDER BY AvgSalary DESC;

-- Expected output:
-- +------------+-----------+
-- | DeptName   | AvgSalary |
-- +------------+-----------+
-- | Management |  67000.00 |
-- | Pharmacy   |  63500.00 |
-- +------------+-----------+
-- 2 rows in set
--
-- Observation: Computer Science (56500.00) is filtered out.

-- ============================================================
-- Q20. Highest Paid Employee
-- ============================================================
-- Find the highest-paid employee among matched employees and display name, department, and salary.

-- What it does: Sorts matched employees by salary from highest to lowest and keeps only the first row with LIMIT 1.
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.Salary DESC
LIMIT 1;

-- Expected output:
-- +---------+------------+----------+
-- | EmpName | DeptName   | Salary   |
-- +---------+------------+----------+
-- | Sneha   | Management | 91000.00 |
-- +---------+------------+----------+
-- 1 row in set
--
-- Observation: Neha earns 80000 but is not matched, so Sneha (91000) is the top matched employee.

-- ============================================================
-- Q21. IN Condition
-- ============================================================
-- Display employees working in either Computer Science or Pharmacy.

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

-- ============================================================
-- Q22. Multiple WHERE Conditions
-- ============================================================
-- Display employees from Delhi or Pune whose salary is at least 50000, with department names.

-- What it does: Combines IN (city) with AND (salary) in WHERE.
SELECT e.EmpName, e.City, e.Salary, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.City IN ('Delhi', 'Pune') AND e.Salary >= 50000
ORDER BY e.EmpID;

-- Expected output:
-- +---------+-------+----------+------------------+
-- | EmpName | City  | Salary   | DeptName         |
-- +---------+-------+----------+------------------+
-- | Aarav   | Delhi | 65000.00 | Computer Science |
-- | Sneha   | Pune  | 91000.00 | Management       |
-- +---------+-------+----------+------------------+
-- 2 rows in set
--
-- Observation: Rahul (48000) and Kabir (43000) are below 50000.

-- ============================================================
-- Q23. Matched Rows Observation
-- ============================================================
-- Use INNER JOIN to display all matched employees. Observe which employee is excluded because no department has DeptID 50.

-- What it does: Lists every employee that has a department. A second, optional check query uses LEFT JOIN to reveal the excluded employee.
-- Main query: only matched employees
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
ORDER BY e.EmpID;

-- Optional check: employees with no matching department
SELECT e.EmpID, e.EmpName, e.DeptID
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

-- Expected output:
-- +-------+---------+--------+------------------+
-- | EmpID | EmpName | DeptID | DeptName         |
-- +-------+---------+--------+------------------+
-- |   101 | Aarav   |     10 | Computer Science |
-- |   102 | Priya   |     20 | Pharmacy         |
-- |   103 | Rahul   |     10 | Computer Science |
-- |   104 | Sneha   |     30 | Management       |
-- |   105 | Vikram  |     20 | Pharmacy         |
-- |   107 | Kabir   |     30 | Management       |
-- +-------+---------+--------+------------------+
-- 6 rows in set
--
-- (Optional check query)
-- +-------+---------+--------+
-- | EmpID | EmpName | DeptID |
-- +-------+---------+--------+
-- |   106 | Neha    |     50 |
-- +-------+---------+--------+
-- 1 row in set
--
-- Observation: 6 of 7 employees appear. Employee 106 (Neha, DeptID 50) is excluded.

-- ============================================================
-- Q24. Natural Join + GROUP BY
-- ============================================================
-- Using NATURAL JOIN, count employees in each department.

-- What it does: Natural join on DeptID, then GROUP BY DeptName with COUNT(*).
SELECT DeptName, COUNT(*) AS TotalEmployees
FROM Employees
NATURAL JOIN Departments
GROUP BY DeptName
ORDER BY DeptName;

-- Expected output:
-- +------------------+----------------+
-- | DeptName         | TotalEmployees |
-- +------------------+----------------+
-- | Computer Science |              2 |
-- | Management       |              2 |
-- | Pharmacy         |              2 |
-- +------------------+----------------+
-- 3 rows in set

-- ============================================================
-- Q25. Final Challenge
-- ============================================================
-- Use an equality-based INNER JOIN to find departments whose total employee salary is greater than 100000. Display department name and total salary.

-- What it does: SUM() adds salaries per department; HAVING keeps groups whose total is above 100000.
SELECT d.DeptName, SUM(e.Salary) AS TotalSalary
FROM Departments d
INNER JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
HAVING SUM(e.Salary) > 100000
ORDER BY TotalSalary DESC;

-- Expected output:
-- +------------------+-------------+
-- | DeptName         | TotalSalary |
-- +------------------+-------------+
-- | Management       |   134000.00 |
-- | Pharmacy         |   127000.00 |
-- | Computer Science |   113000.00 |
-- +------------------+-------------+
-- 3 rows in set
--
-- Observation: All three departments with employees pass the 100000 limit with the given data.
