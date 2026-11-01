-- ============================================================
-- Database Technologies Lab Sheet 5 (MCA105P) - Setup Script
-- Creates CollegeJoinDB, its 3 tables and the sample data.
-- Safe to re-run: uses IF NOT EXISTS and REPLACE INTO, and never
-- drops or touches any other database.
-- ============================================================

CREATE DATABASE IF NOT EXISTS CollegeJoinDB;
USE CollegeJoinDB;

CREATE TABLE IF NOT EXISTS Departments (
    DeptID   INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employees (
    EmpID   INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID  INT,
    Salary  DECIMAL(10,2),
    City    VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS SalaryGrades (
    Grade     CHAR(2) PRIMARY KEY,
    MinSalary DECIMAL(10,2),
    MaxSalary DECIMAL(10,2)
);

-- REPLACE INTO re-inserts a row if its primary key already exists,
-- so running this script again does not create duplicates or errors.
REPLACE INTO Departments VALUES
(10,'Computer Science','Block A'),
(20,'Pharmacy','Block B'),
(30,'Management','Block C'),
(40,'Civil Engineering','Block D');

REPLACE INTO Employees VALUES
(101,'Aarav',10,65000,'Delhi'),
(102,'Priya',20,72000,'Mumbai'),
(103,'Rahul',10,48000,'Delhi'),
(104,'Sneha',30,91000,'Pune'),
(105,'Vikram',20,55000,'Jaipur'),
(106,'Neha',50,80000,'Bengaluru'),
(107,'Kabir',30,43000,'Pune');

REPLACE INTO SalaryGrades VALUES
('G1',0,49999),
('G2',50000,69999),
('G3',70000,89999),
('G4',90000,120000);

-- Verify the setup
SHOW TABLES;
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM SalaryGrades;
