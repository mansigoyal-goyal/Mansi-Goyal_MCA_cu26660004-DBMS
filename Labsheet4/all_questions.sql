-- ======================================================================
-- all_questions.sql - all 55 questions in the order of the PDF
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
--
-- Run database_setup.sql FIRST, then run this file.
-- Statements that are MEANT to fail (Q4, Q6, Q9, Q10, Q13-Q15, Q17, Q18) are
-- commented out here so the whole file runs without stopping. Run their own
-- Qn.sql file to see the error.
-- ======================================================================

USE sql_lab;
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)


-- ----------------------------------------------------------------------
-- QUESTION:
-- 1. Identify the primary key of Department and explain why DeptID is suitable.
-- ----------------------------------------------------------------------
-- Answer: DeptID is the primary key of Department.
-- It uniquely identifies each department, cannot be NULL (because it is a primary key),
-- and its values never repeat. DESCRIBE shows 'PRI' in the Key column for DeptID.

DESCRIBE Department;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 2. Create Department so that DeptID is a PRIMARY KEY. Insert the four dummy department records.
-- ----------------------------------------------------------------------
-- The first lines drop any old copy of the table so this question can be re-run safely.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Department;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

INSERT INTO Department VALUES
(10,'Computer Science'), (20,'Information Technology'),
(30,'Pharmacy'), (40,'Management');

SELECT * FROM Department;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 3. Create Student so that StudentID is a PRIMARY KEY. Insert the five dummy student records.
-- ----------------------------------------------------------------------
-- The first lines drop any old copy of the table so this question can be re-run safely.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Student;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Age INT,
    DeptID INT,
    JoiningDate DATE
);

INSERT INTO Student VALUES
(101,'Amit Sharma','amit@example.com',20,10,'2026-07-01'),
(102,'Priya Singh','priya@example.com',21,20,'2026-07-03'),
(103,'Rahul Verma','rahul@example.com',22,30,'2026-07-05'),
(104,'Neha Gupta','neha@example.com',20,10,'2026-07-08'),
(105,'Arjun Mehta','arjun@example.com',23,40,'2026-07-10');

SELECT * FROM Student;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 4. Try to insert another student with StudentID = 101. What happens?
-- ----------------------------------------------------------------------
-- What happens: MySQL rejects the row because StudentID 101 already exists and a
-- PRIMARY KEY value must be unique. Nothing is inserted.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q4.sql to see the error. Expected: ERROR - Duplicate entry '101' for key 'Student.PRIMARY'
-- INSERT INTO Student VALUES (101,'Karan Shah','karan@example.com',21,20,'2026-08-01');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 5. Create Enrollment with EnrollmentID as its PRIMARY KEY and insert the four dummy enrollment records.
-- ----------------------------------------------------------------------
-- The first lines drop any old copy of the table so this question can be re-run safely.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Enrollment;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(100)
);

INSERT INTO Enrollment VALUES
(1,101,'DBMS'), (2,102,'Operating Systems'),
(3,103,'Pharmacology'), (4,104,'Python');

SELECT * FROM Enrollment;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 6. Try to insert another enrollment with EnrollmentID = 1. What happens?
-- ----------------------------------------------------------------------
-- What happens: MySQL rejects the row because EnrollmentID 1 already exists
-- (duplicate PRIMARY KEY value). Nothing is inserted.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q6.sql to see the error. Expected: ERROR - Duplicate entry '1' for key 'Enrollment.PRIMARY'
-- INSERT INTO Enrollment VALUES (1,105,'Data Mining');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 7. Add a FOREIGN KEY from Student(DeptID) to Department(DeptID).
-- ----------------------------------------------------------------------
-- Student is the child table and Department is the parent table.

ALTER TABLE Student
ADD CONSTRAINT fk_student_department FOREIGN KEY (DeptID) REFERENCES Department(DeptID);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 8. Add a FOREIGN KEY from Enrollment(StudentID) to Student(StudentID).
-- ----------------------------------------------------------------------
-- Enrollment is the child table and Student is the parent table.

ALTER TABLE Enrollment
ADD CONSTRAINT fk_enrollment_student FOREIGN KEY (StudentID) REFERENCES Student(StudentID);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 9. Try to insert a student with DeptID = 99. Explain the result.
-- ----------------------------------------------------------------------
-- Explanation: Department has no DeptID 99, so the foreign key constraint stops the
-- insert. A child row cannot point to a parent row that does not exist.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q9.sql to see the error. Expected: ERROR - Cannot add or update a child row: a foreign key constraint fails
-- INSERT INTO Student VALUES (106,'Riya Das','riya@example.com',21,99,'2026-08-01');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 10. Try to insert an enrollment for StudentID = 999. Explain the result.
-- ----------------------------------------------------------------------
-- Explanation: Student has no StudentID 999, so the foreign key constraint stops the
-- insert. An enrollment must belong to an existing student.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q10.sql to see the error. Expected: ERROR - Cannot add or update a child row: a foreign key constraint fails
-- INSERT INTO Enrollment VALUES (5,999,'DBMS');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 11. Display students together with their department names using an INNER JOIN.
-- ----------------------------------------------------------------------
-- INNER JOIN returns only the rows where Student.DeptID matches Department.DeptID.

SELECT s.StudentID, s.Name, d.DeptName
FROM Student s
INNER JOIN Department d ON s.DeptID = d.DeptID;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 12. Display enrollment details together with the student name using an INNER JOIN.
-- ----------------------------------------------------------------------
-- INNER JOIN returns only the enrollments whose StudentID matches a Student row.

SELECT e.EnrollmentID, s.Name, e.CourseName
FROM Enrollment e
INNER JOIN Student s ON e.StudentID = s.StudentID;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 13. Create a Department table where DeptName cannot be NULL. Try inserting a department without DeptName. What happens?
-- ----------------------------------------------------------------------
-- The PDF's solution uses a table called Department2 (Department already exists).

DROP TABLE IF EXISTS Department2;

CREATE TABLE Department2 (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- What happens: NOT NULL does not allow a NULL DeptName, so the insert fails.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q13.sql to see the error. Expected: ERROR - Column 'DeptName' cannot be null
-- INSERT INTO Department2 VALUES (50,NULL);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 14. Try inserting a Student without providing Name. What happens?
-- ----------------------------------------------------------------------
-- What happens: Name is NOT NULL and has no default value, so MySQL rejects the row.
-- (The PDF shows "Column 'Name' cannot be null"; MySQL 8.0 words it slightly differently
-- when a column is left out - see outputs/expected_outputs.md.)

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q14.sql to see the error. Expected: ERROR - Field 'Name' doesn't have a default value
-- INSERT INTO Student (StudentID, Email, Age, DeptID) VALUES
-- (106,'riya@example.com',21,20);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 15. Modify Student so that Email must be UNIQUE. Try inserting a duplicate email.
-- ----------------------------------------------------------------------
ALTER TABLE Student
ADD CONSTRAINT uq_student_email UNIQUE (Email);

-- What happens: amit@example.com already exists, so the duplicate is rejected.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q15.sql to see the error. Expected: ERROR - Duplicate entry 'amit@example.com' for key 'Student.uq_student_email'
-- INSERT INTO Student
-- VALUES (106,'Riya Das','amit@example.com',21,20,'2026-08-01');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 16. Create a Library table where BookID must be UNIQUE. Insert five books.
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS Library;

CREATE TABLE Library (
    BookID INT UNIQUE,
    Title VARCHAR(150) NOT NULL
);

INSERT INTO Library VALUES
(1,'Database Systems'),
(2,'Operating Systems'),
(3,'Computer Networks'),
(4,'Python Programming'),
(5,'Data Mining');

SELECT * FROM Library;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 17. Add a CHECK constraint to Student so that Age must be greater than 18. Test an invalid record.
-- ----------------------------------------------------------------------
ALTER TABLE Student
ADD CONSTRAINT chk_student_age CHECK (Age > 18);

-- Test: age 17 breaks the rule, so the insert is rejected.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q17.sql to see the error. Expected: ERROR - Check constraint 'chk_student_age' is violated.
-- INSERT INTO Student
-- VALUES (106,'Riya Das','riya@example.com',17,20,'2026-08-01');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 18. Create a Course table where Credits must be between 1 and 6. Test an invalid record.
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS Course;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT CHECK (Credits BETWEEN 1 AND 6)
);

-- Test: 8 credits is outside 1-6, so the insert is rejected.

-- INTENTIONAL ERROR (skipped here so this file runs without stopping).
-- Run Q18.sql to see the error. Expected: ERROR - Check constraint 'Course_chk_1' is violated.
-- INSERT INTO Course VALUES (1,'DBMS',8);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 19. Add JoiningDate to Student with the current date as its DEFAULT. Insert a student without specifying JoiningDate.
-- ----------------------------------------------------------------------
-- Student already has a JoiningDate column, so (as in the PDF's solution) the new column
-- is named JoiningDate2. DEFAULT (CURRENT_DATE) needs MySQL 8.0.13 or later.

ALTER TABLE Student
ADD COLUMN JoiningDate2 DATE DEFAULT (CURRENT_DATE);

INSERT INTO Student (StudentID, Name, Email, Age, DeptID)
VALUES (106,'Riya Das','riya@example.com',21,20);

SELECT * FROM Student;

-- In the new row, JoiningDate2 holds the date on which you ran the insert.


-- ----------------------------------------------------------------------
-- QUESTION:
-- 20. Create a Faculty table where Designation defaults to 'Lecturer'. Insert a faculty record without Designation.
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS Faculty;

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) DEFAULT 'Lecturer'
);

INSERT INTO Faculty (FacultyID, FacultyName)
VALUES (1,'Dr. Meera Sharma');

SELECT * FROM Faculty;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 21. Create an employees table with emp_id, name, department, salary and hire_date.
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(80),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 22. Insert one employee using all columns.
-- ----------------------------------------------------------------------
INSERT INTO employees VALUES (101,'John Smith','IT',55000,'2024-01-15');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 23. Insert multiple employees in one statement.
-- ----------------------------------------------------------------------
INSERT INTO employees VALUES
(102,'Sarah Johnson','HR',48000,'2024-02-10'),
(103,'Mike Davis','Finance',52000,'2024-01-20'),
(104,'Lisa Wilson','Marketing',45000,'2024-03-01');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 24. Insert an employee using only selected columns, leaving salary and hire_date NULL.
-- ----------------------------------------------------------------------
INSERT INTO employees (emp_id,name,department) VALUES (107,'David Clark','Sales');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 25. Display all employees.
-- ----------------------------------------------------------------------
SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 26. Display all employees.
-- ----------------------------------------------------------------------
SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 27. Display names and salaries only.
-- ----------------------------------------------------------------------
SELECT name, salary FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 28. Display only IT employees.
-- ----------------------------------------------------------------------
SELECT * FROM employees WHERE department = 'IT';


-- ----------------------------------------------------------------------
-- QUESTION:
-- 29. List employees with salary above 50,000.
-- ----------------------------------------------------------------------
SELECT * FROM employees WHERE salary > 50000;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 30. Find employees hired in January 2024.
-- ----------------------------------------------------------------------
SELECT * FROM employees WHERE hire_date BETWEEN '2024-01-01' AND '2024-01-31';


-- ----------------------------------------------------------------------
-- QUESTION:
-- 31. Show distinct departments.
-- ----------------------------------------------------------------------
SELECT DISTINCT department FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 32. Count total employees.
-- ----------------------------------------------------------------------
SELECT COUNT(*) AS total_employees FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 33. Find maximum, minimum and average salary.
-- ----------------------------------------------------------------------
-- MAX, MIN and AVG ignore NULL salaries (David Clark has none).

SELECT MAX(salary) AS maximum_salary,
       MIN(salary) AS minimum_salary,
       AVG(salary) AS average_salary
FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 34. Update John Smith's salary to 58,000.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = 58000 WHERE name = 'John Smith';

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 35. Increase HR employees' salary by 5%.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = salary * 1.05 WHERE department = 'HR';

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 36. Update Lisa Wilson's salary to 47,000 and hire date to 2024-03-05.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = 47000, hire_date = '2024-03-05' WHERE name = 'Lisa Wilson';

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 37. Change department to Operations where salary is below 50,000.
-- ----------------------------------------------------------------------
-- Rows with a NULL salary (David Clark) do not match 'salary < 50000'.

SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET department = 'Operations' WHERE salary < 50000;

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 38. Add 2,000 to all Finance employees.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET salary = salary + 2000 WHERE department = 'Finance';

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 39. Change department to Senior Staff for employees hired before February 1, 2024.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

UPDATE employees SET department = 'Senior Staff' WHERE hire_date < '2024-02-01';

-- Check the result:

SELECT * FROM employees;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 40. Delete products with zero stock.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

DELETE FROM products WHERE stock_quantity = 0;

-- Check the result:

SELECT * FROM products;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 41. Delete Electronics items priced over 1000.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

DELETE FROM products WHERE category = 'Electronics' AND price > 1000;

-- Check the result:

SELECT * FROM products;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 42. Delete the Desk Chair.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

DELETE FROM products WHERE product_name = 'Desk Chair';

-- Check the result:

SELECT * FROM products;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 43. Delete items priced under 100.
-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;  -- lets UPDATE/DELETE work with a non-key WHERE (MySQL Workbench blocks it by default)

DELETE FROM products WHERE price < 100;

-- Check the result:

SELECT * FROM products;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 44. Display students sorted by marks in descending order.
-- ----------------------------------------------------------------------
SELECT * FROM students ORDER BY marks DESC;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 45. Show the top 5 scorers.
-- ----------------------------------------------------------------------
SELECT * FROM students ORDER BY marks DESC LIMIT 5;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 46. List Computer Science students alphabetically by name.
-- ----------------------------------------------------------------------
SELECT * FROM students WHERE course = 'Computer Science' ORDER BY student_name ASC;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 47. Show the bottom 3 scorers.
-- ----------------------------------------------------------------------
SELECT * FROM students ORDER BY marks ASC LIMIT 3;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 48. List students with marks between 80 and 90.
-- ----------------------------------------------------------------------
-- BETWEEN includes both 80 and 90.

SELECT * FROM students WHERE marks BETWEEN 80 AND 90;


-- ----------------------------------------------------------------------
-- QUESTION:
-- 49. Display students whose names start with 'A'.
-- ----------------------------------------------------------------------
SELECT * FROM students WHERE student_name LIKE 'A%';


-- ----------------------------------------------------------------------
-- QUESTION:
-- 50. Show students from Mumbai or Delhi.
-- ----------------------------------------------------------------------
SELECT * FROM students WHERE city IN ('Mumbai','Delhi');


-- ----------------------------------------------------------------------
-- QUESTION:
-- 51. Create Books with book_id as PRIMARY KEY, title as NOT NULL, author, isbn as UNIQUE and genre.
-- ----------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Books;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    isbn VARCHAR(13) UNIQUE,
    genre VARCHAR(50)
);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 52. Create Members with member_id as PRIMARY KEY, name as NOT NULL, email as UNIQUE and phone_number.
-- ----------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Members;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 53. Create Loans with loan_id as PRIMARY KEY, book_id and member_id as FOREIGN KEYs, loan_date and nullable return_date.
-- ----------------------------------------------------------------------
-- Books and Members (Q51, Q52) must exist first because Loans refers to them.

DROP TABLE IF EXISTS Loans;

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 54. Insert at least three books, three members and three loans.
-- ----------------------------------------------------------------------
-- Books and Members are inserted before Loans because of the foreign keys.

INSERT INTO Books VALUES
(1,'Database System Concepts','Korth','9780073523323','Database'),
(2,'Operating System Concepts','Silberschatz','9781119456339','OS'),
(3,'Python Crash Course','Eric Matthes','9781718502703','Programming');

INSERT INTO Members VALUES
(101,'Amit Sharma','amit.lib@example.com','9876500001'),
(102,'Priya Singh','priya.lib@example.com','9876500002'),
(103,'Rahul Verma','rahul.lib@example.com','9876500003');

INSERT INTO Loans VALUES
(1,1,101,'2026-09-01',NULL),
(2,2,102,'2026-09-02','2026-09-06'),
(3,3,103,'2026-09-04',NULL);


-- ----------------------------------------------------------------------
-- QUESTION:
-- 55. Display loan details with book title and member name using joins.
-- ----------------------------------------------------------------------
SELECT l.loan_id, b.title, m.name, l.loan_date, l.return_date
FROM Loans l
INNER JOIN Books b ON l.book_id = b.book_id
INNER JOIN Members m ON l.member_id = m.member_id;
