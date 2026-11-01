-- Database Technologies Lab Sheet 8 (MCA105P) - Database Setup
-- Run this file FIRST.

CREATE DATABASE IF NOT EXISTS Hospital_Functions_Lab;
USE Hospital_Functions_Lab;

DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Medicines;

CREATE TABLE Patients(
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    WeightKg DECIMAL(5,2),
    ConsultationFee DECIMAL(10,2)
);

CREATE TABLE Medicines(
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    Stock INT
);

INSERT INTO Patients VALUES
(201,'Asha',24,'F',55.5,600),
(202,'Rohan',35,'M',72.0,800),
(203,'Meera',29,'F',61.5,700),
(204,'Vivek',46,'M',85.0,1000),
(205,'Nitin',17,'M',58.0,500),
(206,'Kavya',52,'F',68.0,900);

INSERT INTO Medicines VALUES
(301,'Paracetamol',25,100),
(302,'Amoxicillin',80,50),
(303,'Cetirizine',35,75),
(304,'Omeprazole',60,40),
(305,'Azithromycin',120,25);

SELECT * FROM Patients;
SELECT * FROM Medicines;
