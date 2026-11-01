-- ======================================================================
-- database_setup.sql
-- Database Technologies Practice Sheet (MCA105P)
--
-- Run this file FIRST. It can be re-run any number of times:
-- it deletes and rebuilds the sql_lab database, so you always start clean.
-- (WARNING: if you already have your own database called sql_lab,
--  it will be replaced.)
-- ======================================================================

DROP DATABASE IF EXISTS sql_lab;
CREATE DATABASE sql_lab;
USE sql_lab;

-- ----------------------------------------------------------------------
-- PART A of the PDF: Database Setup and Dummy Data
-- Parent table first (Department), then the child tables (Student, Enrollment).
-- Foreign keys are NOT added here: the PDF adds them later in Q7 and Q8.
-- ----------------------------------------------------------------------
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Age INT,
    DeptID INT,
    JoiningDate DATE
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(100)
);

INSERT INTO Department VALUES
(10,'Computer Science'),
(20,'Information Technology'),
(30,'Pharmacy'),
(40,'Management');

INSERT INTO Student VALUES
(101,'Amit Sharma','amit@example.com',20,10,'2026-07-01'),
(102,'Priya Singh','priya@example.com',21,20,'2026-07-03'),
(103,'Rahul Verma','rahul@example.com',22,30,'2026-07-05'),
(104,'Neha Gupta','neha@example.com',20,10,'2026-07-08'),
(105,'Arjun Mehta','arjun@example.com',23,40,'2026-07-10');

INSERT INTO Enrollment VALUES
(1,101,'DBMS'),
(2,102,'Operating Systems'),
(3,103,'Pharmacology'),
(4,104,'Python');

-- ----------------------------------------------------------------------
-- Exercise 4 (Q40-Q43): products table.
-- The PDF gives only the data, not a CREATE TABLE, so the data types
-- below are sensible choices (see README).
-- ----------------------------------------------------------------------
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products VALUES
(1,'Laptop','Electronics',999.99,5),
(2,'Mouse','Electronics',25.50,0),
(3,'Desk Chair','Furniture',150.00,3),
(4,'Monitor','Electronics',1200.00,2),
(5,'Keyboard','Electronics',75.00,0),
(6,'Coffee Mug','Office',12.99,10),
(7,'Notebook','Office',5.99,8),
(8,'Smartphone','Electronics',1500.00,1);

-- ----------------------------------------------------------------------
-- Exercise 5 (Q44-Q50): students table (different from the Student table above).
-- Again the PDF gives only the data, so the data types are chosen here.
-- ----------------------------------------------------------------------
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1,'Alice Brown','Computer Science',85,'Mumbai'),
(2,'Bob Wilson','Mathematics',92,'Delhi'),
(3,'Carol Davis','Computer Science',78,'Mumbai'),
(4,'David Miller','Physics',88,'Chennai'),
(5,'Eva Garcia','Mathematics',95,'Delhi'),
(6,'Frank Johnson','Computer Science',82,'Bangalore'),
(7,'Grace Lee','Physics',90,'Mumbai'),
(8,'Henry Smith','Mathematics',76,'Chennai'),
(9,'Ivy Chen','Computer Science',89,'Delhi'),
(10,'Jack Taylor','Physics',84,'Bangalore');

-- The other tables (Department2, Library, Course, Faculty, employees,
-- Books, Members, Loans) are created by the questions that ask for them.
