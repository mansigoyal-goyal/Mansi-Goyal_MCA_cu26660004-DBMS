-- Database Technologies Lab Sheet 7 (MCA105P) - Database Setup
-- Run this file FIRST.

CREATE DATABASE IF NOT EXISTS Hospital_Cursor_Trigger_Lab;
USE Hospital_Cursor_Trigger_Lab;

DROP TABLE IF EXISTS Fee_Log;
DROP TABLE IF EXISTS Doctor_Audit;
DROP TABLE IF EXISTS Doctors;

CREATE TABLE Doctors(
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    Department VARCHAR(40),
    ConsultationFee DECIMAL(10,2),
    Status VARCHAR(20)
);

INSERT INTO Doctors VALUES
(201,'Dr. Anil','Cardiology',1200,'Active'),
(202,'Dr. Beena','Pediatrics',900,'Active'),
(203,'Dr. Chirag','Neurology',1500,'Active'),
(204,'Dr. Divya','Dermatology',1000,'Active'),
(205,'Dr. Eshan','Cardiology',1300,'Active'),
(206,'Dr. Farah','Pediatrics',850,'Active');

CREATE TABLE Doctor_Audit(
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorID INT,
    ActionType VARCHAR(30),
    OldFee DECIMAL(10,2),
    NewFee DECIMAL(10,2),
    ActionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Fee_Log(
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorID INT,
    DoctorName VARCHAR(50),
    OldFee DECIMAL(10,2),
    NewFee DECIMAL(10,2),
    ChangedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Doctors;
SELECT * FROM Doctor_Audit;
SELECT * FROM Fee_Log;
